class Path
	INITIAL = 0
	HEADER = 1
	TIMING_PATH_HEADER = 2
	TIMING_PATH = 3
	TIMING_PATH_START = 4
	TIMING_PATH_END =5
	def initialize(startpoint = nil, endpoint = nil, at = 0)
		@startpoint = startpoint
		@endpoint = endpoint
		@arrival_time = at
		@gates_along_path = []
	end
	def startpoint
		@startpoint 
	end 
	def set_arrival_time(at)
		@arrival_time = at
	end
	def set_endpoint ( endpoint) 
		@endpoint = endpoint
	end
	def add_gate(gate)
		@gates_along_path.delete(gate) if @gates_along_path[-1] == gate
		@gates_along_path.push(gate)
	end
	def self.parse_timing_file(file = "timing.path")
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
					path.set_arrival_time(line_seg[3].to_f)
					critical_paths.push(path) 
					state = TIMING_PATH_END
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
			end
		end
		critical_paths
	end
end
		
