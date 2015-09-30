require './timing.rb'
lib = Library.new('NangateOpenCellLibrary_typical_ccs.lib')
lib2 = Library.new('NangateOpenCellLibrary_fast_ccs.lib')
ckt = Circuit.new('gates.txt', lib,10)
#control_ckt = Circuit.new('gates.control', lib)
ap = mat_gen(ckt.critical_paths, ckt.clusters, 0.25)
cost_gen(ap, ckt.clusters) 

# compare 
#sum_logic = 0
#sum_naive = 0
#count = 0
#(0..99).each do |i|
#	sp = ckt.random_paths(2)
#	r = simu_knob(ap, sp.to_set, ckt.clusters)
#	rr = naive_simu_knob(ap, sp.to_set, ckt.clusters)
#	ld1 = leakage_diff(r, ckt.clusters, lib, lib2)
#	sum_logic += ld1
#	ld2 = leakage_diff(rr, ckt.clusters, lib, lib2)
#	sum_naive += ld2
#
#	if ld2 > ld1 
#		count += 1
#	end
#	
#	print "logic: ",  ld1 , " naive: ", ld2, " diff:", ld2 - ld1,"\n"
#end
#print "proposed method: ", sum_logic / 99, "\n"
#print "naive method: ", sum_naive / 99, "\n"
#print "count: ", count, "\n"

sum_logic = 0
sum_naive = 0
true_count_logic = 0
true_count_naive = 0
true_count_all_low = 0
true_count_all_high = 0
times = 5000
rat = 2.05
all_cluster_paths = ckt.clusters.to_id.map{|id| [id,[]] }

(1..times).each do |i|
	ckt.update_variation
	on = ckt.simu_sensor(rat)
	r = simu_knob(ap, on.to_set, ckt.clusters)
	rr = naive_simu_knob(ap, on.to_set, ckt.clusters)
	ld_logic = leakage_diff(r, ckt.clusters, lib, lib2)
	sum_logic += ld_logic
	ld_naive = leakage_diff(rr, ckt.clusters, lib, lib2)
	sum_naive += ld_naive
	true_count_logic += 1 if ckt.check_timing(rat, r)
	true_count_naive += 1 if ckt.check_timing(rat, rr)
	true_count_all_low += 1 if ckt.check_timing(rat, [] ) 
	true_count_all_high += 1 if ckt.check_timing(rat, all_cluster_paths  )
end


print "proposed method \n"
print "------------\n"
print "leakage increase: ", sum_logic / (0.0 + times), "\n"
print "timing yield: ", true_count_logic / (0.0 + times), "\n", "\n"

print "naive method \n"
print "------------\n"
print "leakage increase: ", sum_naive / (0.0 + times), "\n"
print "timing yield: ", true_count_naive / (0.0 + times), "\n"

print "all low \n"
print "-------------\n"
print "timing yield: ", true_count_all_low / (0.0 + times ), "\n", "\n"

print "all high \n"
print "-------------\n"
print "leakage increase: ", leakage_diff(all_cluster_paths, ckt.clusters, lib, lib2), "\n"
print "timing yield: ", true_count_all_high / (0.0 + times) , "\n", "\n"
