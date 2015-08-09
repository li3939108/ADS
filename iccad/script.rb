require './timing.rb'
p = Path.parse_timing_file
s = Path.select_paths(p)
c = Cluster.parse_GinC_file
pl = Placement.new
pl.parse_def
pl.update_variation(1, 0.2)
mat_gen(s, c)
