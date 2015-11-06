require 'set'
require_relative './graphmatch.rb'

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
	attr_accessor :area
	attr_accessor :leakage
end
class Circuit
	INITIAL = 0
	HEADER = 1
	TIMING_PATH_HEADER = 2
	TIMING_PATH = 3
	TIMING_PATH_START = 4
	TIMING_PATH_END =5
	FINISH = 6
	def initialize(gates, library , sensor_limit = 15, sigma = [] , stage = "pr", potential = 0.8, preassigned_adaptivity = nil)
		@library = library 
		@gate_delay = {}
		@gate_delay_high_voltage = {}
		@gate_delay_variation = {}
		@original_critical_paths = []
		@critical_paths = []
		@gate_reference = {}
		@total_area = 0
		@total_leakage = 0
		@max_delay = 0
		@arrival_time = []
		@full_paths = []
		@rand  =  RandomGaussian.new(1, sigma[0])
		@rand2 = RandomGaussian.new(1, sigma[1])
		@rand3 = RandomGaussian.new(1, sigma[2])
		@rand4 = RandomGaussian.new(sigma[3][0] , sigma[3][1] ) 
		parse_gates(gates, library)
		parse_timing_file("timing.#{stage}.low", potential, 'low') 
		parse_timing_file("timing.#{stage}.high", 0, 'high')
		select_paths(sensor_limit, potential)
		parse_GinC_file('GinC.txt', preassigned_adaptivity) 
		update_variation 
	end
	attr_accessor :max_delay,:library,:arrival_time, :total_leakage, 
		:gate_arrival_time, :original_critical_paths, :full_paths,
		:clusters, :rand3, :matching
	def lib
		@library
	end
	def update_variation
		inter = @rand2.rand
		@clusters.update_variation
		@gate_delay.each_key do |g|
			if @clusters.gate_cluster[g] == nil
				spatial = 1
			else
				spatial =  @clusters.variation[ @clusters.gate_cluster[g] ]
			end
			@gate_delay_variation[g] = inter * (@rand.rand + spatial - 1 ) * @rand4.rand
		end
	end
	def gate_variation(gate)
		@gate_delay_variation[gate]
	end
	def inspect
		to_s
	end
	def to_s
		{:critical_paths => @critical_paths.map{|p| p.arrival_time}, 
		:number_of_gates => @gate_reference.length, 
		:area => @total_area, 
		:leakage => @total_leakage}
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
	attr_accessor :critical_paths
	def gate_reference( gate )
		@gate_reference[ gate ]
	end
	def simu_sensor(on_arrival_time, cluster_paths= [].to_set,  rat = nil)
		@critical_paths.select do |p|
			if cluster_paths.empty?
				at = p.arrival_time('yes')  
			else
				at = p.new_arrival_time(cluster_paths, @clusters) 
			end
			if rat == nil
				at > on_arrival_time
			else
				at < rat and at > on_arrival_time
			end
		end
	end
	def parse_gates(file = 'gates.txt', library )
		gates_file = File.new(file, "r")
		gates_file.each do |line|
			seg = line.split(/[\s]+/)
			seg.delete("")
			if seg.length >= 2 
				@gate_reference[ seg[1] ] = seg[0] 
				@total_area += library.area[ seg[0] ]
				@total_leakage += library.leakage[seg[0]]
			end
		end
	end
	def select_paths( limit = 15, potential)
		covered_gates = Set.new
		selected_paths = []
		while limit > 0
			@critical_paths.sort!{|x,y| (( x.arrival_time - @max_delay * potential) * x.fresh ) <=> 
				( (y.arrival_time - @max_delay * potential) * y.fresh) }
			#@critical_paths.sort!{|x,y| (( x.arrival_time ) * x.fresh ) <=> ( (y.arrival_time ) * y.fresh) }
			path = @critical_paths.pop
			print "fresh: ", path.fresh, " arrivel: ", path.arrival_time, "\n"
			selected_paths.push(path) 
			covered_gates = covered_gates + path.gates
			@critical_paths.each do |p|
				p.update_fresh(covered_gates)
			end
			limit = limit - 1
		end
		@critical_paths = selected_paths 
	end
	def parse_GinC_file(file = 'GinC.txt' , preassigned_adaptivity = nil)
		ginc_file = File.new(file, "r") 
		@clusters = Cluster.new(self, preassigned_adaptivity)
		ginc_file.each do |line|
			line_seg = line.split(/\s/)
			line_seg.delete("")
			if line_seg.length == 2
				@clusters.set_gate_cluster( line_seg[0], line_seg[1].to_i )
			end
		end
		if @clusters.adaptivity == nil
			@clusters.adaptivity = @clusters.clustered_gates.keys.to_set
		end
		@clusters
	end
	def random_paths(number = 1)
		@critical_paths.sample(number ) 
	end
	def parse_timing_file(file = "timing.pr.low", threshold = 0.75, voltage = 'low')
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
					design_name = line[9..-2] if voltage == 'low'
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
					@arrival_time.push ( at ) if voltage == 'low'
					@full_paths.push(path)  if voltage == 'low'
					if @critical_paths.length == 0 or at >= threshold * @critical_paths[0].arrival_time
						path.set_arrival_time( at ) 
						if voltage == 'low'
							@max_delay = path.arrival_time if @critical_paths.length == 0
							@critical_paths.push(path) 
							@original_critical_paths.push(path)
						end
						state = TIMING_PATH_END
					else
						if voltage == 'low'
							state = FINISH
						elsif voltage == 'high'
							state = TIMING_PATH_END
						end

					end
				elsif (line_seg.length == 3 and (line_seg[2] == "r" or line_seg[2] == "f"  ) ) or
					(line_seg.length == 4 and (line_seg[3] == "r" or line_seg[3] == "f" ))
					if voltage == 'low'
						path.set_gate_delay(temp_gate, line_seg[0].to_f ) 
						path.gate_arrival_time.push([temp_gate, line_seg[2]]) if  (line_seg[3] == "r" or line_seg[3] == "f" ) 
						path.gate_arrival_time.push([temp_gate, line_seg[1]]) if (line_seg[2] == "r" or line_seg[2] == "f"  )
					end
					set_gate_delay(temp_gate, line_seg[0].to_f, voltage)
				elsif line_seg.length == 3 
					temp_gate = line_seg[0] 
				elsif line_seg.length == 6 or line_seg.length == 7
					path.add_gate(line_seg[0]) if voltage == 'low'
					if voltage == 'low'
						path.set_gate_delay(line_seg[0], line_seg[3].to_f) 
						path.gate_arrival_time.push([line_seg[0], line_seg[5] ]) if  (line_seg[6] == "r" or line_seg[6] == "f" ) 
						path.gate_arrival_time.push([line_seg[0], line_seg[4] ]) if (line_seg[5] == "r" or line_seg[5] == "f"  )
					end
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
	def matching_cluster_gen
		aff_clt_set = @critical_paths.map{|p|  p.affecting_cluster & @clusters.adaptivity }.reduce(Set.new, :+).to_a
		edges = {}
		h = @critical_paths.map{|p| p.hash }
		@critical_paths.each do |p|
			edges[p.hash] = {}; edges[p.hash + 1] = {}
			p.affecting_cluster.each do |c|
				edges[p.hash][c] = (@clusters.to_cost[c] / 1000).to_i
				edges[p.hash + 1][c] = (@clusters.to_cost[c] / 1000).to_i
			end
		end
		@matching = Graphmatch.match(@critical_paths, aff_clt_set, edges) 
		@matching.values
	end
	def check_timing(rat, cluster_path)
		@original_critical_paths.each do |p|
			if p.new_arrival_time(cluster_path, @clusters) > rat 
				return false
			end
		end
		true
	end
end
class Cluster
	def initialize(ckt, preassigned_adaptivity = nil)
		@gate_cluster = {}
		@clustered_gates = {}
		@circuit = ckt
		@variation = {}
		if preassigned_adaptivity == nil
			@adaptivity = nil
		elsif preassigned_adaptivity.kind_of?(Array)
			@adaptivity = preassigned_adaptivity.to_set 
		end
		@cost = {}
	end
	attr_accessor :adaptivity, :clustered_gates, :gate_cluster, 
		:variation
	def update_variation
		@clustered_gates.keys.each do |c|
			@variation[c] = @circuit.rand3.rand
		end
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
	def to_cost
		@clustered_gates.merge(@clustered_gates) do |k,v|
			leakage(@circuit.library, k) 
		end
	end
	def to_id
		@clustered_gates.keys
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
					lib.leakage[ @circuit.gate_reference(g) ]
				}.reduce(0.0, :+) 
			end
		else
			@clustered_gates[ cluster_id ].map{ |g|
				if lib.leakage[  @circuit.gate_reference(g) ]  == nil
					print "nil", g, @circuit.gate_reference(g), "\n"
					0.0
				else
					lib.leakage[  @circuit.gate_reference(g) ]
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
			@rand =  RandomGaussian.new(u, sigma[0] ) 
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
	def inspect
		to_s
	end
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
		@gate_arrival_time = []
	end
	attr_accessor :gate_arrival_time, :cluster_delay_sum
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
		# remove large wire delay
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
		@gates_along_path.map { |g|
			if cluster_id.include?( clt.g2c(g) )
				if @circuit.gate_delay(g, 'high') == nil
					delay(g, 'yes')
				else
					@circuit.gate_delay(g, 'high') - delay(g, 'no') + delay(g, 'yes') 
				end
			else
				delay(g, 'yes') 
			end
		}.reduce(0.0, :+)
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
	def select_(clt, limit)
		sum_effective_at = 0
		if @important_cluster.length != 0
			return 
		end
		@gates_along_path.each do |g|
			c = clt.g2c(g) 
			if c == nil or @gate_delay[g] > 1
			elsif @cluster_delay_sum[c] == nil
				@cluster_delay_sum[c] = @gate_delay[g] 
				sum_effective_at +=  @gate_delay[g]
			else
				@cluster_delay_sum[c] += @gate_delay[g]
				sum_effective_at +=  @gate_delay[g]
			end
		end
		@important_cluster = @cluster_delay_sum.to_a.sort{|b,a| a[1] <=> b[1]}[0,limit.to_i].map{|a| a[0]}.to_set
	end
	def cluster(clt, threshold = 0.2)
		sum_effective_at = 0
		if @important_cluster.length != 0
			return 
		end
		@gates_along_path.each do |g|
			c = clt.g2c(g) 
			if c == nil or @gate_delay[g] > 1
			elsif @cluster_delay_sum[c] == nil
				@cluster_delay_sum[c] = @gate_delay[g] 
				sum_effective_at +=  @gate_delay[g]
			else
				@cluster_delay_sum[c] += @gate_delay[g]
				sum_effective_at +=  @gate_delay[g]
			end
		end
		@important_cluster = @cluster_delay_sum.select{|k,v|
			(v + 0.0) / sum_effective_at >= threshold
		}.keys.to_set 
	end
end
def leakage_diff(cluster_paths, clt, low_lib, high_lib)
	cluster_paths.map { |c|
		0.75 * clt.leakage(low_lib, c[0] ) #Leakage Power
	}.reduce(0.0, :+) 
end
def maxflow_simu_knob(affected_paths, on_paths, ckt)
	cluster_paths = [].to_set
	on_paths.each do |p|
		cluster_paths += affected_paths.select{|c| c[0] == ckt.matching[p.hash] or c[0] == ckt.matching[p.hash+1] }.to_set
	end
	$stderr.print "maxflow: ", cluster_paths.map{|p| p[0] } , "\n"
	cluster_paths
end
def naive_simu_knob(affected_paths, on_paths, clt)
	cluster_paths = [].to_set
	on_paths.each do |p|
		#choose min cost cluster
		cluster_paths += affected_paths.select{|c| c[0] == (clt.adaptivity & p.affecting_cluster).min{|c| clt.to_cost[c] } }.to_set
	end
	$stderr.print "naive: ", cluster_paths.map{|p| p[0] } , "\n"
	cluster_paths
end
def fsm_naive(affected_paths, existing_cluster_paths, on_paths, clt)
	cluster_paths = existing_cluster_paths.to_set
	on_paths.each do |p|
		cluster_paths += affected_paths.select{|c| c[0]==
			(clt.adaptivity & p.affecting_cluster - 
			existing_cluster_paths.map{|path| path[0] }.to_set).min{|c| clt.to_cost[c] } }.to_set
	end
	cluster_paths
end
def finite_state(affected_paths, on_paths, ckt, ret, limit = 2)
	cluster_paths = simu_knob(affected_paths, on_paths, ckt.clusters).to_set
	(1..limit).each do |i|
		on_paths = ckt.simu_sensor(ret, cluster_paths ) 
		if on_paths.empty? then break end
		cluster_paths = fsm_naive(affected_paths, cluster_paths, on_paths, ckt.clusters).to_set
		$stderr.print "fsm#{i}: ", cluster_paths.map{|p| p[0] } , "\n"
	end
	$stderr.print "fsm: ", cluster_paths.map{|p| p[0] } , "\n"
	cluster_paths
end
def simu_knob(affected_paths, on_paths, clt)
	# sorting in descending order
	sorted_paths = affected_paths.sort{|a,b| (on_paths & a[1]).length <=> (on_paths & b[1]).length }
	intersections = []
	cluster_paths = []
	sorted_paths.each do |p|
		intersect =  on_paths & p[1]
		temp_intersect = intersect 
		
		if intersect.length == 0
		else
			fully_coverd = false
			contain_equal_set = []
			intersections.each do | intersect_exist| 
				if intersect_exist.subset?(temp_intersect) 
					temp_intersect = temp_intersect - intersect_exist 
					contain_equal_set.push(intersect_exist)
				end
				fully_coverd = true if temp_intersect.empty?
			end
		#	i_to_replace = contain_equal_set.map{|is| intersections.index(is) }
			if fully_coverd == true
			#	coverd_cost = i_to_replace.map{|i| 
			#		clt.to_cost[ cluster_paths[i][0] ] }.reduce(0,:+)
				coverd_cost = contain_equal_set.map{|is| 
					clt.to_cost[ cluster_paths[ intersections.index(is) ][0] ] }.reduce(0,:+) 
				if coverd_cost > clt.to_cost[ p[0] ]
					contain_equal_set.map do |is| 
						i = intersections.index(is) 
						cluster_paths.delete_at(i)
						intersections.delete_at(i)
					end
					#i_to_replace.each do |i|
					#	cluster_paths.delete_at(i)
					#	intersections.delete_at(i)
					#end
					cluster_paths.push(p)
					intersections.push(intersect) 
				end
			else
				contain_equal_set.map do |is| 
					i = intersections.index(is) 
					cluster_paths.delete_at(i)
					intersections.delete_at(i)
				end
				#i_to_replace.each do |i|
				#	cluster_paths.delete_at(i)
				#	intersections.delete_at(i)
				#end
				cluster_paths.push(p)
				intersections.push(intersect) 
			end
		end
	end
	$stderr.print "Proposed: ", cluster_paths.map{|p| p[0] } , "\n"
	cluster_paths
end
def cost_gen(affected_paths, clt)
	cost_file = File.new("cost_input", "w") 
	affected_paths.each do |paths_with_cluster|
		cost_file.print clt.to_cost[ paths_with_cluster[0] ], " "
	end
	cost_file.close
end
def mat_gen(paths, clt, cluster_th = 0.2)
	if cluster_th > 1.0  then paths.each{|p| p.select_(clt, cluster_th); }
	else paths.each{|p| p.cluster(clt, cluster_th); } end
	
	aff_clt_set = paths.map{|p|  p.affecting_cluster & clt.adaptivity }
	affected_paths = aff_clt_set.reduce(Set.new, :+).map do |c|
		[c, paths.select{|p| p.affecting_cluster.include?(c) }.to_set]
	end
	
#	for i in (0..affected_paths.length - 1) do 
#		affected_paths.sort!{|b,a| a[1].length <=> b[1].length}
#		#affected_paths = affected_paths[0,i] + affected_paths[i..-1].sort{|a,b| clt.to_cost[ a[0] ]<=>clt.to_cost[ b[0] ]}
#		for j in (i+1..affected_paths.length - 1) do
#			offset = affected_paths[j][1] - affected_paths[i][1] 
#			intersection = affected_paths[j][1] & affected_paths[i][1] 
##			if intersection.length < offset.length
#			if offset.length > 0
#				affected_paths[j][1] = affected_paths[j][1] - intersection
#			end
##			else
##				affected_paths[j][1] = affected_paths[j][1] - offset
##			end
#		end
#	end
	index_file = File.new("index_cluster", "w")
	mat_file = File.new("mat_input", "w") 
	mat = affected_paths.map do |path_with_number|
		index_file.print path_with_number[0], ' '
		(0..paths.length - 1).map{|index|  
			path_with_number[1].include?(paths[index]) ? 1 : 0}
	end
	mat.each do |row|
		row.each do |colomn|
			mat_file.print colomn,' '
		end
		mat_file.print "\n"
	end
	mat_file.close
	index_file.close
	affected_paths
end
def  block_dist(paths_of_interest, cluster_id = nil, clt)
	if cluster_id == nil
		ret = {}
		paths_of_interest.each do |p|
			pre_g = nil
			p.gate_arrival_time.each do |g|
				if pre_g == nil 
					pre_g = g
					next
				end
				if clt.gate_cluster[g[0] ] == clt.gate_cluster[pre_g[0] ] 
					pre_g = g
				else
					if ret[ clt.gate_cluster[pre_g[0] ] ] == nil 
						ret[ clt.gate_cluster[pre_g[0] ] ] = [ pre_g[1] ]
						pre_g = g
					else
						ret[ clt.gate_cluster[pre_g[0] ] ].push(pre_g[1] )
						pre_g = g
					end
				end
			end
		end
	else
		ret = []
		paths_of_interest.each do |p|
			pre_g = nil
			p.gate_arrival_time.each do |g|
				if pre_g == nil 
					pre_g = g
					next
				end
				if clt.gate_cluster[g[0] ] == clt.gate_cluster[pre_g[0] ] or clt.gate_cluster[pre_g[0] ] != cluster_id
					pre_g = g
				else
					ret.push(pre_g[1] )
					pre_g = g
				end
			end
		end
	end
	ret.map{|number| number.to_f} 
end
