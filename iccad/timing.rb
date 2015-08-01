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
class Path
	INITIAL = 0
	HEADER = 1
	TIMING_PATH_HEADER = 2
	TIMING_PATH = 3
	TIMING_PATH_START = 4
	TIMING_PATH_END =5
	FINISH = 6
	def initialize(startpoint = nil, endpoint = nil, at = 0)
		@startpoint = startpoint
		@endpoint = endpoint
		@arrival_time = at
		@gates_along_path = Set.new
		@fresh = 1
		@cluster_factor = {}
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
