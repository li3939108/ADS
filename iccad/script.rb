#! /usr/bin/env ruby
require '../timing.rb'
lib = Library.new('NangateOpenCellLibrary_typical_ccs.lib')
lib2 = Library.new('NangateOpenCellLibrary_fast_ccs.lib')
if ARGV[3] != nil
	ckt = Circuit.new('gates.txt', lib, ARGV[2].to_i, [0.0441, 0.0491], 'pr' ,0.8 , ARGV[3].split(",").map{|i| i.to_i} ) 
	print "with adaptivity:", ARGV[3].split(",").map{|i| i.to_i},"\n" 
else
	ckt = Circuit.new('gates.txt', lib, ARGV[2].to_i, [0.0441, 0.0491], 'pr' ,0.8 )
end
#control_ckt = Circuit.new('gates.control', lib)
ap = mat_gen(ckt.critical_paths, ckt.clusters, 0.2)
cost_gen(ap, ckt.clusters) 

sum_logic = 0
sum_naive = 0
true_count_logic = 0
true_count_naive = 0
true_count_all_low = 0
true_count_all_high = 0
on_count = 0
on_2_count = 0
times = ARGV[1].to_i
rat = 1.05 * ARGV[0].to_f
all_cluster_paths = ckt.clusters.to_id.map{|id| [id,[]] }

print "total_leakage: ", ckt.total_leakage, "\n"


(1..times).each do |i|
	print (i-1)/(0.0+times), "...done\n"

	if i % 50 == 0
	print "2 sensors on count:", on_2_count, "\n"
	print "on count:", on_count, "\n"
	print "total count:", i, "\n"
	print "proposed method \n"
	print "------------\n"
	print "leakage increase: ", sum_logic / (0.0 + i), ' ', sum_logic / (0.0 + on_count) , "\n"
	print "timing yield: ", true_count_logic / (0.0 + i), "\n", "\n"

	print "naive method \n"
	print "------------\n"
	print "leakage increase: ", sum_naive / (0.0 + i), ' ', sum_naive / (0.0 + on_count),"\n"
	print "timing yield: ", true_count_naive / (0.0 + i), "\n", "\n"

	print "all low \n"
	print "-------------\n"
	print "timing yield: ", true_count_all_low / (0.0 + i ), "\n", "\n"

	print "all high \n"
	print "-------------\n"
	print "leakage increase: ", leakage_diff(all_cluster_paths, ckt.clusters, lib, lib2), "\n"
	print "timing yield: ", true_count_all_high / (0.0 + i) , "\n", "\n"
	end

	ckt.update_variation
	on = ckt.simu_sensor(rat)
	if on.length == 0
		if ckt.check_timing(rat, [] ) 
			true_count_all_low += 1 
			true_count_logic += 1 
			true_count_naive += 1 
		end
		true_count_all_high += 1 if ckt.check_timing(rat, all_cluster_paths  )
	else
		on_2_count += 1 if on.length > 1
		on_count += 1
		r = simu_knob(ap, on.to_set, ckt.clusters)
		rr = naive_simu_knob(ap, on.to_set, ckt.clusters)
		if (r == rr)
			ld_logic = leakage_diff(r, ckt.clusters, lib, lib2)                   	
		        sum_logic += ld_logic
			sum_naive += ld_logic 
			if ckt.check_timing(rat, r)
				true_count_logic += 1 
				true_count_naive += 1 
			end
			true_count_all_low += 1 if ckt.check_timing(rat, [] ) 
			true_count_all_high += 1 if ckt.check_timing(rat, all_cluster_paths  )
		else
			ld_logic = leakage_diff(r, ckt.clusters, lib, lib2)
			sum_logic += ld_logic
			ld_naive = leakage_diff(rr, ckt.clusters, lib, lib2)
			sum_naive += ld_naive
			true_count_logic += 1 if ckt.check_timing(rat, r)
			true_count_naive += 1 if ckt.check_timing(rat, rr)
			true_count_all_low += 1 if ckt.check_timing(rat, [] ) 
			true_count_all_high += 1 if ckt.check_timing(rat, all_cluster_paths  )
		end
	end
end

