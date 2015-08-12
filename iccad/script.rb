require './timing.rb'
lib = Library.new('NangateOpenCellLibrary_typical_ccs.lib')
ckt = Circuit.new('gates.txt', lib)
ap = mat_gen(ckt.critical_paths, ckt.clusters, 0.3)
cost_gen(ap, ckt.clusters) 

