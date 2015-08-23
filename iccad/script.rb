require './timing.rb'
lib = Library.new('NangateOpenCellLibrary_typical_ccs.lib')
lib2 = Library.new('NangateOpenCellLibrary_fast_ccs.lib')
ckt = Circuit.new('gates.txt', lib)
#control_ckt = Circuit.new('gates.control', lib)
ap = mat_gen(ckt.critical_paths, ckt.clusters, 0.25)
cost_gen(ap, ckt.clusters) 

# compare 
(0..100).each do |i|
	sp = ckt.random_paths(2)
	r = simu_knob(ap, sp.to_set, ckt.clusters)
	rr = naive_simu_knob(ap, sp.to_set, ckt.clusters)
	print leakage_diff(r, ckt.clusters, lib, lib2) , leakage_diff(rr, ckt.clusters, lib, lib2), "\n"
end
