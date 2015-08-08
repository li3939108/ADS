require 'set'

class Cluster
	def initialize
		@gate_cluster = {}
		@clustered_gates = {}
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
	def to_s
		@clustered_gates.merge(@clustered_gates) do |k,v|
			v.length 
		end
	end
	def self.parse_GinC_file(file = 'GinC.txt')
		ginc_file = File.new(file, "r") 
		cluster = Cluster.new
		ginc_file.each do |line|
			line_seg = line.split(/\s/)
			cluster.set_gate_cluster( line_seg[0], line_seg[1].to_i )
		end
		cluster
	end
end

class Placement
	INITIAL = 0
	COMPONENTS_START = 1
	FINISH = 2
	def initialize 
		@gate_loc = {}
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
	def dist(g1, g2)
		@gate_loc[g1].map.with_index{|v, i| v - @gate_loc[g2][i] }
	end
end
class Path
	INITIAL = 0
	HEADER = 1
	TIMING_PATH_HEADER = 2
	TIMING_PATH = 3
	TIMING_PATH_START = 4
	TIMING_PATH_END =5
	FINISH = 6
	def to_s
		{'startpoint'=>@startpoint, 'endpoint' => @endpoint, 'arrival_time'=>@arrival_time, 
		'length of gates along path'=>@gates_along_path.length,
		'fresh rate'=>@fresh, 'cluster'=> @important_cluster }
	end
	def initialize(startpoint = nil, endpoint = nil, at = 0)
		@startpoint = startpoint
		@endpoint = endpoint
		@arrival_time = at
		@gates_along_path = Set.new
		@fresh = 1
		@cluster_count = {}
		@important_cluster = Set.new
	end
	def affecting_cluster
		@important_cluster
	end
	def fresh
		@fresh
	end
	def update_fresh(covered_gates = Set.new) 
		uncovered_gates = @gates_along_path - covered_gates
		@fresh = (uncovered_gates.length + 0.0) / (@gates_along_path.length + 0.0)
	end
	def gates
		@gates_along_path
	end
	def arrival_time
		@arrival_time 
	end
	def startpoint
		@startpoint 
	end 
	def endpoint
		@endpoint
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
			if @cluster_count[c] == nil
				@cluster_count[c] = 1
			else
				@cluster_count[c] += 1
			end
		end
		@important_cluster = @cluster_count.select{|k,v|
			(v + 0.0) / (@gates_along_path.length + 0.0) >= threshold
		}.keys
	end
	def self.parse_timing_file(file = "timing.path", threshold = 0.75)
		timing_file = File.new(file, "r") 
		state = INITIAL
		design_name = " " 
		critical_paths = []
		path = nil
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
					path = Path.new(line_seg[2] ) 
				elsif line_seg[1] == "Endpoint"
					path.set_endpoint ( line_seg[2] ) 
				elsif line_seg[1].include?("------------------------") 
					state = TIMING_PATH
				end
			elsif state == TIMING_PATH
				line_seg = line.split(/[\s()\/]+/)
				line_seg.delete("")
				if line_seg[0] == path.startpoint 
					path.add_gate(line_seg[0] ) 
					state = TIMING_PATH_START
				end
			elsif state == TIMING_PATH_START
				line_seg = line.split(/[\s()\/]+/)
				line_seg.delete("")
				if line_seg[0] == "data" and line_seg[1] == "arrival" and line_seg[2] = "time"
					at = line_seg[3].to_f
					if critical_paths.length == 0 or at >= threshold * critical_paths[0].arrival_time			
						path.set_arrival_time( at )
						critical_paths.push(path) 
						state = TIMING_PATH_END
					else
						state = FINISH
					end
				elsif line_seg.length == 3 and (line_seg[2] == "r" or line_seg[2] == "f"  ) 
				else
					path.add_gate(line_seg[0])
				end
			elsif state == TIMING_PATH_END
				line_seg = line.split(/[\s()\/]+/)
				line_seg.delete("")
				if line_seg[0] == "slack"
					state = TIMING_PATH_HEADER
				end
			elsif state == FINISH
				timing_file.close		
				return critical_paths
			end
		end
	end
	def self.select_paths(candidates, limit = 15)
		covered_gates = Set.new
		selected_paths = []
		while limit > 0
			candidates.sort!{|x,y| (x.arrival_time * x.fresh ) <=> (y.arrival_time * y.fresh) }
			path = candidates.pop
			selected_paths.push(path) 
			covered_gates = covered_gates + path.gates
			candidates.each do |p|
				p.update_fresh(covered_gates)
			end
			limit = limit - 1
		end
		selected_paths
	end

end
def mat_gen(paths, clt)
	paths.each do |p|
		p.cluster(clt)
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
	ret = affected_paths.map do |path_with_number|
		print path_with_number, "\n"
		print paths.length, "\n"
		(0..paths.length - 1).map{|index|  
			path_with_number[1].include?(paths[index]) ? 1 : 0}
	end
#	ret = aff_clt_set.reduce(Set.new, :+).map do |c|
#		aff_clt_set.map{|clt|  clt.include?(c) ? 1 : 0 }
#	end
#	
	ret.each do |row|
		row.each do |colomn|
			print colomn,' '
		end
		print "\n"
	end
end
