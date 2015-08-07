require './timing.rb'
p = Path.parse_timing_file
s = Path.select_paths(p)
c = Cluster.parse_GinC_file
mat_gen(s, c)
