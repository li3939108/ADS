verilog_file_list = Dir['*.v']
if verilog_file_list.length == 1 
	verilog_file_name= verilog_file_list[0] 
	cluster_file = File.new("gatesInClusters.txt", "r") 
	verilog_file = File.new(verilog_file_name, "r" )
	verilog = verilog_file.read
	cluster_file.each do |line|
		gate_out_cluster = line.split(" ") 
		matched_line = verilog.match(/\w+[ ]+\w+[ ]*\(.+\(#{gate_out_cluster[0]}\)[ ]*\);/)
		if(matched_line == nil)
			raise("no such output wire")
		else
			puts matched_line[0] 
		end
	end
	cluster_file.close
elsif verilog_file_list.length  == 0
	raise("no verilog file in this directory") 
else
	raise("more than one verilog file in this directory") 
end
