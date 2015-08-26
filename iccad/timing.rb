require 'set'

class RandomGaussian
	def initialize(mean, stddev, rand_helper = lambda { Kernel.rand })
		@rand_helper = rand_helper
		@mean = mean
		@stddev = stddev
		@valid = false
		@next = 0
	end

	 def rand
		if @valid then
			@valid = false
			return @next
		else
			@valid = true
			x, y = self.class.gaussian(@mean, @stddev, @rand_helper)
			@next = y
			return x
		end
	end

	private
	def self.gaussian(mean, stddev, rand)
		theta = 2 * Math::PI * rand.call
		rho = Math.sqrt(-2 * Math.log(1 - rand.call))
		scale = stddev * rho
		x = mean + scale * Math.cos(theta)
		y = mean + scale * Math.sin(theta)
		return x, y
	end
end
class Library
	INITIAL = 0
	ENTER_LIB = 1
	OP_CON = 2
	CELL = 3
	def initialize(file_name)
		@area = {}
		@leakage = {}
		file = File.new(file_name)
		state = INITIAL
		brace = 0
		cell = nil
		file.each do |line|
			if state == INITIAL 
				line_seg = line.split(/[()\{\s]+/)
				if line_seg.length == 2 and line_seg[0] == 'library' 
					@name = line_seg[1] 
					state = ENTER_LIB
				end
			elsif state == ENTER_LIB
				line_seg = line.split(/[()\{\s]+/)
				line_seg.delete("")
				if line_seg.length == 2 and line_seg[0] == 'operating_conditions'
					state = OP_CON
				elsif line_seg.length == 2 and line_seg[0] == "cell" 
					state = CELL
					cell = line_seg[1] 
					brace = 0
				end
			elsif state == OP_CON
				line_seg = line.split(/[\s:;]+/) 
				line_seg.delete("")
				if line_seg.length == 1 and line_seg[0] == "}"
					state = ENTER_LIB
				elsif line_seg.length == 2 and line_seg[0] == "voltage"
					@voltage = line_seg[1].to_f 
				end
			elsif state = CELL
				line_seg = line.split(/[\s:;]+/)
				line_seg.delete("")
				if line_seg.last == "{"
					brace += 1
				elsif line_seg.last == "}"
					if brace == 0
						state = ENTER_LIB
					else
						brace -= 1
					end
				elsif line_seg.length == 2 and line_seg[0] == 'area'
					@area[cell]  =  line_seg[1].to_f
				elsif line_seg.length == 2 and line_seg[0] == 'cell_leakage_power'
					@leakage[cell]  =  line_seg[1].to_f
				end
			end
		end
	end
	def area(cell)
		@area[cell]
	end
	def leakage(cell)
		@leakage[cell]
	end
end
class Circuit
	INITIAL = 0
	HEADER = 1
	TIMING_PATH_HEADER = 2
	TIMING_PATH = 3
	TIMING_PATH_START = 4
	TIMING_PATH_END =5
	FINISH = 6
	def initialize(gates, library , sigma = 0.3)
		@gate_delay = {}
		@gate_delay_high_voltage = {}
		@gate_delay_variation = {}
		@origianal_critical_paths = []
		@critical_paths = []
		@gate_reference = {}
		@total_area = 0
		@total_leakage = 0
		@rand =  RandomGaussian.new(1, sigma)
		parse_gates(gates, library)
		parse_timing_file
		parse_timing_file('timing.high', 0.75, 'high')
		select_paths
		parse_GinC_file
		update_variation 
	end
	def update_variation
		@gate_delay.each_key do |g|
			@gate_delay_variation[g] = @rand.rand
		end
	end
	def gate_variation(gate)
		@gate_delay_variation[gate]
	end
	def to_s
		{:critical_paths => @critical_paths.map{|p| p.arrival_time}, 
		:number_of_gates => @gate_reference.length, 
		:area => @total_area, 
		:leakage => @total_leakage}
	end
	def clusters
		@clusters
	end
	def set_gate_delay(gate, delay, voltage = 'low')
		if voltage == 'low'
			@gate_delay[gate] = delay
		elsif voltage == 'high'
			@gate_delay_high_voltage[gate ] = delay
		end
	end
	def add_critical_path(path)
		@critical_paths.push(path)
	end
	def gate_delay(gate, voltage = 'low')
		if voltage == 'low' 
			@gate_delay[gate]
		elsif voltage == 'high'
			@gate_delay_high_voltage[gate]
		end
	end
	def critical_paths
		@critical_paths
	end
	def gate_reference( gate )
		@gate_reference[ gate ]
	end
	def simu_sensor(on_arrival_time)
		@critical_paths.select do |p|
			p.arrival_time('yes') > on_arrival_time
		end
	end
	def parse_gates(file = 'gates.txt', library )
		gates_file = File.new(file, "r")
		gates_file.each do |line|
			seg = line.split(/[\s]+/)
			seg.delete("")
			if seg.length >= 2 
				@gate_reference[ seg[1] ] = seg[0] 
				@total_area += library.area(seg[0])
				@total_leakage += library.leakage(seg[0])
			end
		end
	end
	def select_paths( limit = 15)
		covered_gates = Set.new
		selected_paths = []
		while limit > 0
			@critical_paths.sort!{|x,y| (x.arrival_time * x.fresh ) <=> (y.arrival_time * y.fresh) }
			path = @critical_paths.pop
			selected_paths.push(path) 
			covered_gates = covered_gates + path.gates
			@critical_paths.each do |p|
				p.update_fresh(covered_gates)
			end
			limit = limit - 1
		end
		@critical_paths = selected_paths 
	end
	def parse_GinC_file(file = 'GinC.txt' )
		ginc_file = File.new(file, "r") 
		@clusters = Cluster.new(self)
		ginc_file.each do |line|
			line_seg = line.split(/\s/)
			line_seg.delete("")
			if line_seg.length == 2
				@clusters.set_gate_cluster( line_seg[0], line_seg[1].to_i )
			end
		end
		@clusters
	end
	def random_paths(number = 1)
		@critical_paths.sample(number ) 
	end
	def parse_timing_file(file = "timing.path", threshold = 0.75, voltage = 'low')
		timing_file = File.new(file, "r") 
		state = INITIAL
		design_name = " " 
		path = nil
		temp_gate = nil
		timing_file.each do | line |
			if state == INITIAL
				if line.include?("***************************")
					state = HEADER 
				end
			elsif state == HEADER 
				if line[0..7] == "Design :"
					design_name = line[9..-2] 
				elsif line.include?("***************************") 
					state = TIMING_PATH_HEADER 
				end
			elsif state == TIMING_PATH_HEADER 
				line_seg = line.split(/[\s:]+/) 
				if line_seg.length < 2
				elsif line_seg[1] == "Startpoint"
					path = Path.new(self, line_seg[2] ) 
				elsif line_seg[1] == "Endpoint"
					path.set_endpoint ( line_seg[2] ) 
				elsif line_seg[1].include?("------------------------") 
					state = TIMING_PATH
				end
			elsif state == TIMING_PATH
				line_seg = line.split(/[\s()\/]+/)
				line_seg.delete("")
				if line_seg[0] == path.startpoint 
					path.add_gate(line_seg[0] ) if voltage == 'low'
					state = TIMING_PATH_START
				end
			elsif state == TIMING_PATH_START
				line_seg = line.split(/[\s()\/]+/)
				line_seg.delete("")
				if line_seg[0] == "data" and line_seg[1] == "arrival" and line_seg[2] = "time"
					at = line_seg[3].to_f 
					if @critical_paths.length == 0 or at >= threshold * @critical_paths[0].arrival_time
						path.set_arrival_time( at ) 
						if voltage == 'low'
							@critical_paths.push(path) 
							@origianal_critical_paths.push(path)
						end
						state = TIMING_PATH_END
					else
						state = FINISH
					end
				elsif line_seg.length == 3 and (line_seg[2] == "r" or line_seg[2] == "f"  ) 
					path.set_gate_delay(temp_gate, line_seg[0].to_f ) if voltage == 'low'
					set_gate_delay(line_seg[0], line_seg[3].to_f, voltage)
				elsif line_seg.length == 3 
					temp_gate = line_seg[0] if voltage == 'low'
				elsif line_seg.length == 6 
					path.add_gate(line_seg[0]) if voltage == 'low'
					path.set_gate_delay(line_seg[0], line_seg[3].to_f) if voltage == 'low'
					set_gate_delay(line_seg[0], line_seg[3].to_f, voltage)
				end
			elsif state == TIMING_PATH_END
				line_seg = line.split(/[\s()\/]+/)
				line_seg.delete("")
				if line_seg[0] == "slack"
					state = TIMING_PATH_HEADER
				end
			elsif state == FINISH
				timing_file.close
				return self
			end
		end
	end
	def check_timing(rat)
		@origianal_critical_paths.each do |p|
			if p.new_arrival_time > rat 
				return false
			end
		end
		true
	end
end
class Cluster
	def initialize(ckt)
		@gate_cluster = {}
		@clustered_gates = {}
		@circuit = ckt
	end
	def set_gate_cluster(gate, cluster) 
		@gate_cluster[gate] = cluster
		if @clustered_gates[cluster] == nil
			@clustered_gates[cluster ] = [gate].to_set
		else
			@clustered_gates[cluster].add( gate ) 
		end
	end
	def g2c(gate)
		@gate_cluster[gate]
	end
	def clustered_gates(cluster_id)
		@clustered_gates[cluster_id]
	end
	def to_cost
		to_s
	end
	def to_s
		@clustered_gates.merge(@clustered_gates) do |k,v|
			v.length 
		end
	end
	def leakage( lib, cluster_id = nil)
		if cluster_id == nil
			@clustered_gates.merge(@clustered_gates) do |id, gates|
				gates.map{|g|
					lib.leakage( @circuit.gate_reference(g) )
				}.reduce(0.0, :+) 
			end
		else
			@clustered_gates[ cluster_id ].map{ |g|
				if lib.leakage( @circuit.gate_reference(g))  == nil
					print "nil", g, @circuit.gate_reference(g), "\n"
					0.0
				else
					lib.leakage( @circuit.gate_reference(g))
				end
			}.reduce(0.0, :+) 
		end
	end
end

class Placement
	INITIAL = 0
	COMPONENTS_START = 1
	FINISH = 2
	def initialize 
		@rand = nil
		@gate_loc = {}
		@gate_delay_derate = {}
	end
	def parse_def(file = 'out.def.txt')
		state = INITIAL
		def_file = File.new(file, "r") 
		def_file.each do |line|
			if state == INITIAL
				line_seg = line.split(' ') 
				if line_seg[0] == 'COMPONENTS'
					state = COMPONENTS_START
				end
			elsif state == COMPONENTS_START
				line_seg = line.split(/[-+();\s]+/)
				line_seg.delete("")
				if line_seg.length == 6  and line_seg[2] == 'PLACED'
					@gate_loc[ line_seg[0] ] = [line_seg[3].to_i, line_seg[4].to_i]
				elsif line_seg.length == 2 and line_seg[0] == 'END' and line_seg[1] == 'COMPONENTS'
					state = FINISH
				end
			elsif state == FINISH
				return
			end
		end
	end
	def g2l(gate)
		@gate_loc[gate]
	end
	def update_variation(u = 1, sigma )
		if @rand == nil
			@rand =  RandomGaussian.new(u, sigma ) 
		end
		@gate_loc.keys.each do |gate|
			@gate_delay_derate[gate] = @rand.rand
		end
		@gate_delay_derate.length
	end
	def derate
		@gate_delay_derate
	end
	def generate_tcl
		prefix = "set_timing_derate -late "
	end
	def dist(g1, g2)
		@gate_loc[g1].map.with_index{|v, i| v - @gate_loc[g2][i] }
	end
end

class Path
	def to_s
		{'startpoint'=>@startpoint, 'endpoint' => @endpoint, 'arrival_time'=>@arrival_time, 
		'length of gates along path'=>@gates_along_path.length,
		'fresh rate'=>@fresh, 'cluster'=> @important_cluster }
	end
	def initialize(ckt, startpoint = nil, endpoint = nil, at = 0)
		@startpoint = startpoint
		@endpoint = endpoint
		@arrival_time = at
		@gates_along_path = Set.new
		@gate_delay = {}
		@fresh = 1
		@cluster_delay_sum = {}
		@important_cluster = Set.new
		@circuit = ckt
	end
	def affecting_cluster
		@important_cluster
	end
	def fresh
		@fresh
	end
	def update_fresh(covered_gates = Set.new) 
		uncovered_gates = @gates_along_path - covered_gates
		uncovered_delay = uncovered_gates.map{|g| @gate_delay[g] }.reduce(0.0, :+) 
		@fresh = uncovered_delay / @arrival_time 
	end
	def gates
		@gates_along_path
	end
	def delay(gate, with_variation = 'no')
		if with_variation == 'no'
			@gate_delay[gate]
		elsif with_variation == 'yes'
			@gate_delay[gate] * @circuit.gate_variation(gate)
		end
	end
	def arrival_time(with_variation = 'no')
		if with_variation == 'no'
			@gates_along_path.map{|g| delay(g) }.reduce(0.0, :+)
		elsif with_variation == 'yes'
			@gates_along_path.map{|g| delay(g, 'yes') }.reduce(0.0, :+)
		end
	end
	def startpoint
		@startpoint 
	end 
	def endpoint
		@endpoint
	end
	def new_arrival_time(cluster_paths, clt)
		cluster_id = cluster_paths.map{|c| c[0] }
		@gates_along_path.map do |g|
			if cluster_id.include?( clt.g2c(g) )
				@circuit.gate_delay(g, 'high') - @circuit.gate_delay(g) + delay(g, 'yes') 
			else
				delay(g, 'yes') 
			end
		end
	end
	def set_gate_delay(gate, value)
		@gate_delay[gate] = value
	end
	def set_arrival_time(at)
		@arrival_time = at
	end
	def set_endpoint ( endpoint) 
		@endpoint = endpoint
	end
	def add_gate(gate)
		@gates_along_path.add(gate)
	end

	def cluster(clt, threshold = 0.25)
		if @important_cluster.length != 0
			return 
		end
		@gates_along_path.each do |g|
			c = clt.g2c(g) 
			if @cluster_delay_sum[c] == nil
				@cluster_delay_sum[c] = @gate_delay[g] 
			else
				@cluster_delay_sum[c] += @gate_delay[g]
			end
		end
		@important_cluster = @cluster_delay_sum.select{|k,v|
			(v + 0.0) / @arrival_time >= threshold
		}.keys
	end
end
def leakage_diff(cluster_paths, clt, low_lib, high_lib)
	cluster_paths.map { |c|
		clt.leakage(high_lib, c[0] ) - clt.leakage(low_lib, c[0] )
	}.reduce(0.0, :+) 
end
def naive_simu_knob(affected_paths, on_paths, clt)
	cluster_paths = []
	on_paths.each do |p|
		cluster_paths += affected_paths.select{|c| c[0] == p.affecting_cluster[0] }
	end
	cluster_paths
end
def simu_knob(affected_paths, on_paths, clt)
	sorted_paths = affected_paths.sort{|b,a| b[1].length <=> b[1].length }
	intersections = []
	cluster_paths = []
	sorted_paths.each do |p|
		intersect =  on_paths & p[1]
		if intersect.length == 0
		else
			contain = false
			intersections.each do | intersect_exist| 
				if intersect.subset?(intersect_exist )
					contain = true
				end
			end
			i_to_replace = intersections.index ( intersect )
			if contain == true
			elsif i_to_replace == nil
				cluster_paths.push(p)
				intersections.push(intersect) 
			elsif  clt.to_cost[ cluster_paths[i_to_replace][0] ] > clt.to_cost[ p[0] ] 
				cluster_paths.delete_at(i_to_replace)
				intersections.delete_at(i_to_replace)
				cluster_paths.push(p)
				intersections.push(intersect) 
			end
		end
	end
	cluster_paths
end
def cost_gen(affected_paths, clt)
	cost_file = File.new("cost_input", "w") 
	affected_paths.each do |paths_with_cluster|
		cost_file.print clt.to_cost[ paths_with_cluster[0] ], " "
	end
end
def mat_gen(paths, clt, cluster_th = 0.3)
	paths.each do |p|
		p.cluster(clt, cluster_th)
	end
	aff_clt_set = paths.map{|p|  p.affecting_cluster }
	affected_paths = aff_clt_set.reduce(Set.new, :+).map do |c|
		[c, paths.select{|p| p.affecting_cluster.include?(c) }.to_set]
	end
	for i in (0..affected_paths.length - 1) do 
		affected_paths.sort!{|b,a| a[1].length <=> b[1].length}
		for j in (i+1..affected_paths.length - 1) do
			offset = affected_paths[j][1] - affected_paths[i][1] 
			intersection = affected_paths[j][1] & affected_paths[i][1] 
			if intersection.length < offset.length
				affected_paths[j][1] = affected_paths[j][1] - intersection
			else
				affected_paths[j][1] = affected_paths[j][1] - offset
			end
		end
	end
	mat = affected_paths.map do |path_with_number|
		(0..paths.length - 1).map{|index|  
			path_with_number[1].include?(paths[index]) ? 1 : 0}
	end
#	ret = aff_clt_set.reduce(Set.new, :+).map do |c|
#		aff_clt_set.map{|clt|  clt.include?(c) ? 1 : 0 }
#	end
#	
	mat_file = File.new("mat_input", "w") 
	mat.each do |row|
		row.each do |colomn|
			mat_file.print colomn,' '
		end
		mat_file.print "\n"
	end
	affected_paths
end
