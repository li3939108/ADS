gate_out_file = File.new("gates.txt")
cluster_file = File.new("gatesInClusters.txt", "r") 
out2gate = {}
gate2cluster = {}
gate_out_file.each do |line|
	gate_out_pair = line.split ( ' ')
	out2gate[gate_out_pair[1] ] = gate_out_pair[0] if gate_out_pair.length == 2
end
gate_out_file.close
cluster_file.each do |line|
	out_cluster = line.split(" ") 
	if out_cluster.length == 2 
		gate2cluster[ out2gate[ out_cluster[0] ] ] = out_cluster[1] 
		puts "#{out2gate[out_cluster[0] ]} #{out_cluster[1]}"
	end
end
cluster_file.close
p = Path.parse_timing_file
s = Path.select_paths(p)
c = Cluster.parse_GinC_file
s.each do |p|
	p.cluster(c)
end
