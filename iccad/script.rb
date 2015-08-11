require './timing.rb'
ckt = Circuit.new
ckt.parse_timing_file
ckt.parse_GinC_file
p = Path.parse_timing_file
s = Path.select_paths(p)
c = Cluster.parse_GinC_file
#pl = Placement.new
#pl.parse_def
#pl.update_variation(1, 0.2)
ap = mat_gen(s, c)
cost_gen(ap, c) 
