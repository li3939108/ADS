require './timing.rb'
lib = Library.new('NangateOpenCellLibrary_typical_ccs.lib')
lib2 = Library.new('NangateOpenCellLibrary_fast_ccs.lib')
ckt = Circuit.new('gates.txt', lib)
#control_ckt = Circuit.new('gates.control', lib)
ap = mat_gen(ckt.critical_paths, ckt.clusters, 0.25)
cost_gen(ap, ckt.clusters) 

# compare 
#sum1 = 0
#sum2 = 0
#count = 0
#(0..99).each do |i|
#	sp = ckt.random_paths(2)
#	r = simu_knob(ap, sp.to_set, ckt.clusters)
#	rr = naive_simu_knob(ap, sp.to_set, ckt.clusters)
#	ld1 = leakage_diff(r, ckt.clusters, lib, lib2)
#	sum1 += ld1
#	ld2 = leakage_diff(rr, ckt.clusters, lib, lib2)
#	sum2 += ld2
#
#	if ld2 > ld1 
#		count += 1
#	end
#	
#	print "logic: ",  ld1 , " naive: ", ld2, " diff:", ld2 - ld1,"\n"
#end
#print "proposed method: ", sum1 / 99, "\n"
#print "naive method: ", sum2 / 99, "\n"
#print "count: ", count, "\n"

sum1 = 0
sum2 = 0
true_count1 = 0
true_count2 = 0
times = 5000

(1..times).each do |i|
	ckt.update_variation
	on = ckt.simu_sensor(6.4)
	r = simu_knob(ap, on.to_set, ckt.clusters)
	rr = naive_simu_knob(ap, on.to_set, ckt.clusters)
	ld1 = leakage_diff(r, ckt.clusters, lib, lib2)
	sum1 += ld1
	ld2 = leakage_diff(rr, ckt.clusters, lib, lib2)
	sum2 += ld2
	true_count1 += 1 if ckt.check_timing(6.5, r)
	true_count2 += 1 if ckt.check_timing(6.5, rr)
end


print "proposed method \n"
print "------------\n"
print "leakage increase: ", sum1 / (0.0 + times), "\n"
print "timing yield: ", true_count1 / (0.0 + times), "\n", "\n"

print "naive method \n"
print "------------\n"
print "leakage increase: ", sum2 / (0.0 + times), "\n"
print "timing yield: ", true_count2 / (0.0 + times), "\n"

