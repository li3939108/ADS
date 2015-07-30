
INITIAL = 0
HEADER = 1
TIMING_PATH_HEADER = 2
TIMING_PATH = 3
TIMING_PATH_MULTILINE = 4
class Path
	def initialize(startpoint = nil, endpoint = nil, at = 0)
		@startpoint = startpoint
		@endpoint = endpoint
		@arrival_time = at
		@gates_along_path = []
	end
	def set_endpoint ( endpoint) 
		@endpoint = endpoint
	end
end
timing_file = File.new('timing.path', "r") 
state = INITIAL
design_name = " " 
critical_paths = []
path = nil
timing_file.each do | line |
	if state == INITIAL
		if line.include?("***************************")
			state = HEADER 
#			puts( " -> HEADER")
		end
	elsif state == HEADER 
		if line[0..7] == "Design :"
			design_name = line[9..-2] 
		elsif line.include?("***************************") 
			state = TIMING_PATH_HEADER 
#			puts( " -> TIMING_PATH_HEADER")
		end
	elsif state == TIMING_PATH_HEADER 
		line_seg = line.split(/[\s:]+/) 
		if line_seg.length < 2
		elsif line_seg[1] == "Startpoint"
			path = Path.new(line_seg[2] ) 
			puts "new paths "
		elsif line_seg[1] == "Endpoint"
			path.set_endpoint ( line_seg[2] ) 
		elsif line_seg[1].include?("------------------------") 
			state = TIMING_PATH
#			puts( " -> TIMING_PATH")
		end
	elsif state == TIMING_PATH
		line_seg = line.split(/[\s()\/]+/)
			
		if line_seg[-1] == "r" or line_seg[-1] == "f"
			if line_seg [-3] != "0.00"
				if line_seg.length == 4			
					path.add_gates(line_seg[1], line_seg[2], line_seg[3] ) 
					state = TIMING_PATH_MULTILINE
				elsif line_seg.length == 6
					path.add_gates(line_seg[1], nil , line_seg[2] ) 
				end
			end
		elsif line_seg[1] == "data" and line_seg[2] == "arrival" and line_seg[3] == "time"
		end
		#critical_paths.push(path) 
	end
end
