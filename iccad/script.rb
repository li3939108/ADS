#! /usr/bin/env ruby
require_relative './timing.rb'
inter_die_std = 0.0931
intra_die_std = (0.0345**2 + 0.0881**2)*(1/2.0)
spatial_std = 0.0345
aging = (1.196 + 1.168 ) / 2
aging_std = (0.0425 + 0.0668) / 2
#aging = 1
#aging_std = 0
lib = Library.new('NangateOpenCellLibrary_typical_ccs.lib')
lib2 = Library.new('NangateOpenCellLibrary_fast_ccs.lib')
if ARGV[5] != nil
	ckt = Circuit.new('gates.txt', lib, ARGV[2].to_i, [intra_die_std, inter_die_std, spatial_std, [aging, aging_std]], 'pr' ,0.7 , ARGV[5].split(",").map{|i| i.to_i} ) 
	print "with adaptivity:", ARGV[5].split(",").map{|i| i.to_i},"\n" 
else
	ckt = Circuit.new('gates.txt', lib, ARGV[2].to_i, [intra_die_std, inter_die_std, spatial_std, [aging, aging_std]], 'pr' ,0.7 )
end
#control_ckt = Circuit.new('gates.control', lib)
ap = mat_gen(ckt.critical_paths, ckt.clusters, ARGV[4].to_f)
ckt.matching_cluster_gen
cost_gen(ap, ckt.clusters) 

sum_logic = 0
sum_maxflow = 0
sum_fsm = 0
sum_coarse = 0

true_count_logic = 0
true_count_maxflow = 0
true_count_fsm = 0
true_count_coarse = 0

true_count_all_low = 0
true_count_adaptive_all_high = 0
true_count_all_high = 0

high_count_fsm = 0
high_count_logic = 0
high_count_maxflow = 0
high_count_coarse = 0

on_count = 0
on_2_count = 0
times = ARGV[1].to_i
rat = ARGV[3].to_f * ARGV[0].to_f
all_cluster_paths = ckt.clusters.to_id.map{|id| [id,[]] }
print "all_cluster_paths: #{all_cluster_paths.map{|p| p[0] } }", "\n"
adaptive_cluster_paths = ap 
print "adaptive_cluster_paths: #{adaptive_cluster_paths.map{|p| p[0] } }", "\n"

print "total_leakage: ", ckt.total_leakage, "\n"

l_diff_all_cluster_high = leakage_diff(all_cluster_paths, ckt.clusters, lib, lib2) 
l_diff_all_adaptive_high = leakage_diff(adaptive_cluster_paths, ckt.clusters, lib, lib2)

(1..times).each do |i|
	print (i-1)/(0.0+times), "...done\n"

	if i % 50 == 0
	print "2 sensors on count:", on_2_count, "\n"
	print "on count:", on_count, "\n"
	print "total count:", i, "\n"
	
	print "coarse method \n"
	print "------------\n"
	print "leakage increase: ", sum_coarse / (0.0 + i), ' ', sum_coarse / (0.0 + on_count) , "\n"
	print "timing yield: ", true_count_coarse / (0.0 + i), "\n"
	print "high_cluster_count: ", high_count_coarse / (0.0 + i), "\n", "\n"
	
	
	print "proposed fsm method \n"
	print "------------\n"
	print "leakage increase: ", sum_fsm / (0.0 + i), ' ', sum_fsm / (0.0 + on_count) , "\n"
	print "timing yield: ", true_count_fsm / (0.0 + i), "\n"
	print "high_cluster_count: ", high_count_fsm / (0.0 + i), "\n", "\n"
	
	print "proposed logic method \n"
	print "------------\n"
	print "leakage increase: ", sum_logic / (0.0 + i), ' ', sum_logic / (0.0 + on_count) , "\n"
	print "timing yield: ", true_count_logic / (0.0 + i), "\n"
	print "high_cluster_count: ", high_count_logic / (0.0 + i), "\n", "\n"

	print "maxflow method \n"
	print "------------\n"
	print "leakage increase: ", sum_maxflow / (0.0 + i), ' ', sum_maxflow / (0.0 + on_count),"\n"
	print "timing yield: ", true_count_maxflow / (0.0 + i), "\n"
	print "high_cluster_count: ", high_count_maxflow / (0.0 + i), "\n", "\n"

	print "all low \n"
	print "-------------\n"
	print "timing yield: ", true_count_all_low / (0.0 + i ), "\n", "\n"

	print "all high \n"
	print "-------------\n"
	print "leakage increase (adaptive all): ",l_diff_all_adaptive_high, "\n"
	print "leakage increase (all): ", l_diff_all_cluster_high, "\n"
	print "timing yield(adaptive all): ", true_count_adaptive_all_high / (0.0 + i) , "\n"
	print "timing yield(all): ", true_count_all_high / (0.0 + i ) , "\n", "\n"
	end

	ckt.update_variation
	on = ckt.simu_sensor(rat)
	if on.length == 0
		if ckt.check_timing(rat, [] ) 
			true_count_all_low += 1 
			true_count_logic += 1 
			true_count_maxflow += 1 
			true_count_fsm += 1
			true_count_coarse += 1
			true_count_adaptive_all_high += 1 
			true_count_all_high += 1 
		end
	else
		on_2_count += 1 if on.length > 1
		on_count += 1
		r = simu_knob(ap, on.to_set, ckt.clusters)
		high_count_logic += r.length
		rr = maxflow_simu_knob(ap, on.to_set, ckt)
		high_count_maxflow += rr.length
		rrr = finite_state(ap, on.to_set, ckt, rat)
		high_count_fsm += rrr.length
		rrrr  =  coarse_simu_knob(ap, on.to_set, ckt)
		high_count_coarse += rrrr.length
		if (r == rr and rr == rrr and rrrr == rrr)
			ld_logic = leakage_diff(r, ckt.clusters, lib, lib2)                   	
		        sum_logic += ld_logic
			sum_maxflow += ld_logic 
			sum_fsm += ld_logic
			sum_coarse += l_diff_all_adaptive_high
			if ckt.check_timing(rat, r)
				true_count_logic += 1 
				true_count_maxflow += 1 
				true_count_fsm += 1
			end
			true_count_all_low += 1 if ckt.check_timing(rat, [] ) 
			if ckt.check_timing(rat, adaptive_cluster_paths  )
				true_count_adaptive_all_high += 1 
				true_count_coarse += 1 
			end
			true_count_all_high += 1 if ckt.check_timing(rat, all_cluster_paths  )
		else
			ld_logic = leakage_diff(r, ckt.clusters, lib, lib2)
			sum_logic += ld_logic
			ld_maxflow = leakage_diff(rr, ckt.clusters, lib, lib2)
			sum_maxflow += ld_maxflow
			ld_fsm = leakage_diff(rrr, ckt.clusters, lib, lib2)
			sum_fsm += ld_fsm 
			sum_coarse += l_diff_all_adaptive_high
			true_count_fsm += 1 if ckt.check_timing(rat, rrr) 
			true_count_logic += 1 if ckt.check_timing(rat, r)
			true_count_maxflow += 1 if ckt.check_timing(rat, rr)
			true_count_all_low += 1 if ckt.check_timing(rat, [] ) 
			if ckt.check_timing(rat, adaptive_cluster_paths  )
				true_count_adaptive_all_high += 1 
				true_count_coarse += 1 
			end
			true_count_all_high += 1 if ckt.check_timing(rat, all_cluster_paths  )
		end
	end
end

print "unclustered:" , ckt.unclustered, "\n"
print "clustered:", ckt.clustered.to_s.reduce(0, :+), "\n"
