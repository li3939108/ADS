# Synopsys Design Constraints Format
# Copyright © 2011, Synopsys, Inc. and others. All Rights reserved.

# clock definition
create_clock -name mclk -period 64000.0 [get_ports iccad_clk]

# input delays
set_input_delay 0.0 [get_ports brdyn] -clock mclk
set_input_delay 0.0 [get_ports bexcn] -clock mclk
set_input_delay 0.0 [get_ports dsuen] -clock mclk
set_input_delay 0.0 [get_ports dsurx] -clock mclk
set_input_delay 0.0 [get_ports dsubre] -clock mclk
set_input_delay 0.0 [get_ports sdcke_0_] -clock mclk
set_input_delay 0.0 [get_ports g3290378_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3298464_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301221_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301222_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301276_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3298493_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3298505_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3298501_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301208_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301226_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301240_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301273_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301220_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301255_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3299375_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3299140_u0_d] -clock mclk
set_input_delay 0.0 [get_ports g3300042_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301414_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301421_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301421_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301423_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301423_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301425_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301425_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301427_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301428_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301428_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301429_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301429_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301431_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301431_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301435_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301435_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301441_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301441_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301446_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301446_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301449_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301449_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301453_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301453_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301454_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301454_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301461_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301461_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301474_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301474_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301484_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301484_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301491_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301491_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301524_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301524_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301529_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301529_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301422_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301422_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301424_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301424_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301426_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301426_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301430_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301430_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301432_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301432_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301433_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301433_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301436_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301436_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301437_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301437_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301438_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301438_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301439_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301439_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301440_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301440_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301442_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301442_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301445_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301445_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301447_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301447_u0_d] -clock mclk
set_input_delay 0.0 [get_ports g3301450_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301450_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301466_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301466_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301470_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301470_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301471_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301471_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301472_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301472_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301473_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301473_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301475_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301475_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301476_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301476_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301485_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301485_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301487_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301487_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301490_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301490_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301502_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301502_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301519_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301519_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301527_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301527_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301528_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301528_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3301526_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301526_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312078_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312079_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312095_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312098_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312123_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312151_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312103_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3315972_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316020_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316061_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316088_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316089_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316157_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316159_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319269_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319272_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318874_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318874_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318882_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318882_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318886_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318886_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318906_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318906_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318907_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318907_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318962_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318962_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318969_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318969_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319027_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319027_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319048_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319048_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319135_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319135_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319199_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319199_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319201_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319201_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319230_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319230_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319278_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319278_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3312155_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318857_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318857_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318863_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318863_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318897_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318897_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318965_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318965_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318983_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318983_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319047_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319047_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319075_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319075_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319078_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319078_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319125_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319125_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319187_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319187_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319210_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319210_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319214_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319214_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319216_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319216_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319233_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319233_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319236_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319236_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319292_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319292_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319302_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319302_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319340_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319340_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318856_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318856_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318885_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318885_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318915_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318915_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318935_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318935_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318938_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318938_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318954_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318954_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318961_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318961_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318964_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318964_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318972_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318972_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319017_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319017_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319030_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319085_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319085_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319104_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319104_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319124_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319124_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319140_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319140_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319158_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319158_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319225_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319225_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319234_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319234_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319240_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319240_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319250_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319250_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319290_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319290_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3316119_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319182_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319182_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319009_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319009_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319024_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319024_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319039_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319039_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319244_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319244_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319339_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319339_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318864_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318864_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318855_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318855_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318876_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318876_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318891_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318891_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318896_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318896_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318899_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318899_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318903_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318903_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318905_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318905_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318922_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318922_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318941_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318941_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318953_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318953_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318975_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318975_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318979_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318979_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318990_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318990_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319003_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319003_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319022_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319022_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319025_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319025_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319044_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319044_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319053_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319053_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319096_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319096_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319127_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319127_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319130_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319130_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319137_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319137_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319147_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319147_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319150_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319150_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319159_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319159_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319205_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319205_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319228_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319228_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319282_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319282_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319319_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319319_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319332_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319332_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319033_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319033_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319338_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319338_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318859_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318859_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318867_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318867_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318887_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318887_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318902_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318902_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318919_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318919_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318927_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318927_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318930_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318930_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318937_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318937_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318942_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318942_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318944_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318944_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318948_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318948_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318956_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318956_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318957_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318957_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318984_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3318984_u0_d] -clock mclk
set_input_delay 0.0 [get_ports g3319052_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319052_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319068_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319068_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319089_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319100_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319100_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319106_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319106_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319113_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319113_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319145_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319145_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319160_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3319160_u0_d] -clock mclk
set_input_delay 0.0 [get_ports g3319171_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319171_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319229_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319229_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319239_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319239_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319260_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319260_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319276_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319276_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319287_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319287_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319317_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319317_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319324_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319324_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319327_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319327_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319342_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319342_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318988_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318988_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319293_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319293_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319286_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319286_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319220_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319220_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319014_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319014_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319018_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319018_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318875_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318875_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319076_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318869_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318869_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318889_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318893_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318894_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318895_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318924_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318926_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318945_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318945_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318960_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318994_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318998_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319036_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319050_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319050_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319060_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319081_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319097_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319099_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319105_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3319120_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319134_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319208_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319242_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319283_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319326_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319123_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319015_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318920_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318868_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319333_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319296_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319263_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319263_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3319217_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319166_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319062_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319035_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3280523_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3287583_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3289616_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3294111_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3298541_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301261_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301274_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301330_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301335_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301344_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301345_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301347_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301358_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301254_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301211_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301225_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301214_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301218_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301236_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301237_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301256_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3307320_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3307374_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3307392_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3307410_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311677_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311704_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311709_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311733_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311736_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311792_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311799_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311813_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311837_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311805_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311671_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3311718_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3313348_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3311745_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301988_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301730_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301866_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301878_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301894_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301947_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301996_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3301998_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3302020_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3302023_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3302022_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301942_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301919_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301905_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301741_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301746_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301783_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301785_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301794_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301798_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301858_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301886_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301930_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3302002_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3302012_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3302018_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301806_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301745_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301986_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3301994_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3307188_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3320368_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320678_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320757_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320767_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3312450_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3320406_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320520_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320706_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320957_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3321008_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320557_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320380_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320512_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320561_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320703_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320730_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320776_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320521_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320390_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320169_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320201_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320322_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320501_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320575_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320736_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320818_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320396_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320578_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320458_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3320812_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320276_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320697_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320516_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320516_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3319549_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319482_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319547_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318534_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318534_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318529_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318529_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318524_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318524_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318525_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318525_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318539_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318539_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318541_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318541_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318542_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318542_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318555_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318555_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318572_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318572_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318585_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318585_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318586_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318586_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318571_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318571_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318522_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318522_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318540_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318540_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318582_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318582_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318561_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318561_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318556_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318556_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318550_u1_b] -clock mclk
set_input_delay 0.0 [get_ports g3318550_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3231182_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3297176_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3297185_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3319446_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319451_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319452_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319426_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319427_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319428_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319429_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319430_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319433_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319435_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319436_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319437_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319441_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319449_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319453_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319456_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319457_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319455_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319444_u1_a] -clock mclk
set_input_delay 0.0 [get_ports g3319987_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3325057_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3325056_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3320873_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3319504_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319501_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3319489_u0_a] -clock mclk
set_input_delay 0.0 [get_ports g3318214_u0_b] -clock mclk
set_input_delay 0.0 [get_ports g3318214_u0_c] -clock mclk
set_input_delay 0.0 [get_ports g3318584_u0_b] -clock mclk

# input drivers
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports brdyn] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports bexcn] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports dsuen] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports dsurx] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports dsubre] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports sdcke_0_] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3290378_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3298464_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301221_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301222_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301276_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3298493_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3298505_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3298501_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301208_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301226_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301240_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301273_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301220_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301255_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3299375_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3299140_u0_d] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3300042_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301414_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301421_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301421_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301423_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301423_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301425_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301425_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301427_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301428_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301428_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301429_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301429_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301431_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301431_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301435_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301435_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301441_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301441_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301446_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301446_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301449_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301449_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301453_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301453_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301454_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301454_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301461_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301461_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301474_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301474_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301484_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301484_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301491_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301491_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301524_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301524_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301529_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301529_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301422_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301422_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301424_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301424_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301426_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301426_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301430_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301430_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301432_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301432_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301433_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301433_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301436_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301436_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301437_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301437_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301438_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301438_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301439_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301439_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301440_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301440_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301442_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301442_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301445_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301445_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301447_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301447_u0_d] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301450_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301450_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301466_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301466_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301470_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301470_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301471_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301471_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301472_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301472_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301473_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301473_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301475_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301475_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301476_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301476_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301485_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301485_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301487_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301487_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301490_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301490_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301502_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301502_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301519_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301519_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301527_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301527_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301528_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301528_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301526_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301526_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312078_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312079_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312095_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312098_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312123_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312151_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312103_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3315972_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316020_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316061_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316088_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316089_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316157_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316159_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319269_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319272_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318874_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318874_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318882_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318882_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318886_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318886_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318906_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318906_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318907_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318907_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318962_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318962_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318969_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318969_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319027_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319027_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319048_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319048_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319135_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319135_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319199_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319199_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319201_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319201_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319230_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319230_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319278_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319278_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312155_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318857_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318857_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318863_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318863_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318897_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318897_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318965_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318965_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318983_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318983_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319047_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319047_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319075_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319075_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319078_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319078_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319125_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319125_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319187_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319187_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319210_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319210_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319214_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319214_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319216_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319216_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319233_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319233_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319236_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319236_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319292_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319292_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319302_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319302_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319340_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319340_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318856_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318856_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318885_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318885_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318915_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318915_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318935_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318935_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318938_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318938_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318954_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318954_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318961_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318961_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318964_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318964_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318972_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318972_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319017_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319017_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319030_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319085_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319085_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319104_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319104_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319124_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319124_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319140_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319140_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319158_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319158_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319225_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319225_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319234_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319234_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319240_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319240_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319250_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319250_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319290_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319290_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3316119_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319182_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319182_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319009_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319009_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319024_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319024_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319039_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319039_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319244_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319244_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319339_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319339_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318864_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318864_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318855_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318855_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318876_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318876_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318891_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318891_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318896_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318896_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318899_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318899_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318903_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318903_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318905_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318905_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318922_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318922_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318941_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318941_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318953_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318953_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318975_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318975_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318979_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318979_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318990_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318990_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319003_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319003_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319022_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319022_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319025_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319025_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319044_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319044_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319053_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319053_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319096_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319096_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319127_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319127_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319130_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319130_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319137_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319137_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319147_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319147_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319150_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319150_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319159_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319159_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319205_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319205_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319228_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319228_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319282_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319282_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319319_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319319_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319332_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319332_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319033_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319033_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319338_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319338_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318859_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318859_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318867_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318867_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318887_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318887_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318902_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318902_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318919_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318919_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318927_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318927_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318930_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318930_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318937_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318937_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318942_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318942_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318944_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318944_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318948_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318948_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318956_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318956_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318957_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318957_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318984_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318984_u0_d] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319052_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319052_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319068_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319068_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319089_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319100_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319100_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319106_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319106_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319113_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319113_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319145_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319145_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319160_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319160_u0_d] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319171_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319171_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319229_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319229_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319239_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319239_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319260_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319260_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319276_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319276_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319287_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319287_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319317_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319317_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319324_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319324_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319327_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319327_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319342_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319342_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318988_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318988_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319293_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319293_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319286_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319286_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319220_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319220_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319014_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319014_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319018_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319018_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318875_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318875_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319076_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318869_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318869_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318889_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318893_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318894_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318895_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318924_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318926_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318945_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318945_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318960_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318994_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318998_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319036_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319050_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319050_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319060_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319081_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319097_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319099_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319105_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319120_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319134_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319208_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319242_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319283_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319326_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319123_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319015_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318920_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318868_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319333_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319296_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319263_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319263_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319217_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319166_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319062_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319035_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3280523_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3287583_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3289616_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3294111_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3298541_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301261_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301274_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301330_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301335_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301344_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301345_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301347_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301358_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301254_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301211_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301225_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301214_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301218_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301236_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301237_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301256_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3307320_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3307374_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3307392_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3307410_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311677_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311704_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311709_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311733_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311736_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311792_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311799_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311813_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311837_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311805_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311671_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311718_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3313348_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3311745_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301988_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301730_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301866_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301878_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301894_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301947_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301996_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301998_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3302020_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3302023_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3302022_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301942_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301919_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301905_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301741_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301746_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301783_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301785_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301794_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301798_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301858_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301886_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301930_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3302002_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3302012_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3302018_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301806_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301745_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301986_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3301994_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3307188_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320368_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320678_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320757_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320767_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3312450_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320406_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320520_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320706_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320957_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3321008_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320557_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320380_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320512_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320561_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320703_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320730_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320776_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320521_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320390_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320169_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320201_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320322_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320501_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320575_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320736_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320818_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320396_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320578_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320458_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320812_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320276_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320697_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320516_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320516_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319549_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319482_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319547_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318534_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318534_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318529_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318529_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318524_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318524_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318525_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318525_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318539_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318539_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318541_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318541_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318542_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318542_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318555_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318555_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318572_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318572_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318585_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318585_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318586_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318586_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318571_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318571_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318522_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318522_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318540_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318540_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318582_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318582_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318561_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318561_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318556_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318556_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318550_u1_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318550_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3231182_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3297176_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3297185_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319446_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319451_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319452_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319426_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319427_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319428_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319429_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319430_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319433_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319435_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319436_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319437_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319441_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319449_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319453_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319456_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319457_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319455_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319444_u1_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319987_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3325057_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3325056_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3320873_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319504_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319501_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3319489_u0_a] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318214_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318214_u0_c] -input_transition_fall 80.0 -input_transition_rise 80.0
set_driving_cell -lib_cell INV_X32 -pin ZN [get_ports g3318584_u0_b] -input_transition_fall 80.0 -input_transition_rise 80.0

# output delays
set_output_delay 0.0 [get_ports errorn] -clock mclk
set_output_delay 0.0 [get_ports address_27_] -clock mclk
set_output_delay 0.0 [get_ports address_26_] -clock mclk
set_output_delay 0.0 [get_ports address_25_] -clock mclk
set_output_delay 0.0 [get_ports address_24_] -clock mclk
set_output_delay 0.0 [get_ports address_23_] -clock mclk
set_output_delay 0.0 [get_ports address_22_] -clock mclk
set_output_delay 0.0 [get_ports address_21_] -clock mclk
set_output_delay 0.0 [get_ports address_20_] -clock mclk
set_output_delay 0.0 [get_ports address_19_] -clock mclk
set_output_delay 0.0 [get_ports address_18_] -clock mclk
set_output_delay 0.0 [get_ports address_17_] -clock mclk
set_output_delay 0.0 [get_ports address_16_] -clock mclk
set_output_delay 0.0 [get_ports address_15_] -clock mclk
set_output_delay 0.0 [get_ports address_14_] -clock mclk
set_output_delay 0.0 [get_ports address_13_] -clock mclk
set_output_delay 0.0 [get_ports address_12_] -clock mclk
set_output_delay 0.0 [get_ports address_11_] -clock mclk
set_output_delay 0.0 [get_ports address_10_] -clock mclk
set_output_delay 0.0 [get_ports address_9_] -clock mclk
set_output_delay 0.0 [get_ports address_8_] -clock mclk
set_output_delay 0.0 [get_ports address_7_] -clock mclk
set_output_delay 0.0 [get_ports address_6_] -clock mclk
set_output_delay 0.0 [get_ports address_5_] -clock mclk
set_output_delay 0.0 [get_ports address_4_] -clock mclk
set_output_delay 0.0 [get_ports address_3_] -clock mclk
set_output_delay 0.0 [get_ports address_2_] -clock mclk
set_output_delay 0.0 [get_ports address_1_] -clock mclk
set_output_delay 0.0 [get_ports address_0_] -clock mclk
set_output_delay 0.0 [get_ports ramsn_4_] -clock mclk
set_output_delay 0.0 [get_ports ramsn_3_] -clock mclk
set_output_delay 0.0 [get_ports ramsn_2_] -clock mclk
set_output_delay 0.0 [get_ports ramsn_1_] -clock mclk
set_output_delay 0.0 [get_ports ramsn_0_] -clock mclk
set_output_delay 0.0 [get_ports ramoen_4_] -clock mclk
set_output_delay 0.0 [get_ports ramoen_3_] -clock mclk
set_output_delay 0.0 [get_ports ramoen_2_] -clock mclk
set_output_delay 0.0 [get_ports ramoen_1_] -clock mclk
set_output_delay 0.0 [get_ports ramoen_0_] -clock mclk
set_output_delay 0.0 [get_ports romsn_1_] -clock mclk
set_output_delay 0.0 [get_ports romsn_0_] -clock mclk
set_output_delay 0.0 [get_ports iosn] -clock mclk
set_output_delay 0.0 [get_ports oen] -clock mclk
set_output_delay 0.0 [get_ports read] -clock mclk
set_output_delay 0.0 [get_ports sdcsn_1_] -clock mclk
set_output_delay 0.0 [get_ports sdcsn_0_] -clock mclk
set_output_delay 0.0 [get_ports sdwen] -clock mclk
set_output_delay 0.0 [get_ports sdrasn] -clock mclk
set_output_delay 0.0 [get_ports sdcasn] -clock mclk
set_output_delay 0.0 [get_ports sddqm_3_] -clock mclk
set_output_delay 0.0 [get_ports sddqm_2_] -clock mclk
set_output_delay 0.0 [get_ports sddqm_1_] -clock mclk
set_output_delay 0.0 [get_ports sddqm_0_] -clock mclk
set_output_delay 0.0 [get_ports dsutx] -clock mclk
set_output_delay 0.0 [get_ports dsuact] -clock mclk
set_output_delay 0.0 [get_ports g3281909_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3281505_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3282010_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3281808_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3281707_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3281606_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3282212_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3282111_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3285446_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3285611_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3285776_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3285281_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3284951_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3286601_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3285116_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3284621_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3284456_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3284291_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3284126_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3286436_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3286271_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3286106_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3281404_u0_o] -clock mclk
set_output_delay 0.0 [get_ports g3285941_u0_o] -clock mclk
set_output_delay 0.0 [get_ports rwen_pad_3_giop0_pad_tri_u1_o] -clock mclk
set_output_delay 0.0 [get_ports rwen_pad_0_giop0_pad_tri_u1_o] -clock mclk
set_output_delay 0.0 [get_ports rwen_pad_2_giop0_pad_tri_u1_o] -clock mclk
set_output_delay 0.0 [get_ports writen_pad_giop0_pad_tri_u1_o] -clock mclk
set_output_delay 0.0 [get_ports rwen_pad_1_giop0_pad_tri_u1_o] -clock mclk
set_output_delay 0.0 [get_ports g3228100_u0_o] -clock mclk

# output loads
set_load -pin_load 4.0 [get_ports errorn]
set_load -pin_load 4.0 [get_ports address_27_]
set_load -pin_load 4.0 [get_ports address_26_]
set_load -pin_load 4.0 [get_ports address_25_]
set_load -pin_load 4.0 [get_ports address_24_]
set_load -pin_load 4.0 [get_ports address_23_]
set_load -pin_load 4.0 [get_ports address_22_]
set_load -pin_load 4.0 [get_ports address_21_]
set_load -pin_load 4.0 [get_ports address_20_]
set_load -pin_load 4.0 [get_ports address_19_]
set_load -pin_load 4.0 [get_ports address_18_]
set_load -pin_load 4.0 [get_ports address_17_]
set_load -pin_load 4.0 [get_ports address_16_]
set_load -pin_load 4.0 [get_ports address_15_]
set_load -pin_load 4.0 [get_ports address_14_]
set_load -pin_load 4.0 [get_ports address_13_]
set_load -pin_load 4.0 [get_ports address_12_]
set_load -pin_load 4.0 [get_ports address_11_]
set_load -pin_load 4.0 [get_ports address_10_]
set_load -pin_load 4.0 [get_ports address_9_]
set_load -pin_load 4.0 [get_ports address_8_]
set_load -pin_load 4.0 [get_ports address_7_]
set_load -pin_load 4.0 [get_ports address_6_]
set_load -pin_load 4.0 [get_ports address_5_]
set_load -pin_load 4.0 [get_ports address_4_]
set_load -pin_load 4.0 [get_ports address_3_]
set_load -pin_load 4.0 [get_ports address_2_]
set_load -pin_load 4.0 [get_ports address_1_]
set_load -pin_load 4.0 [get_ports address_0_]
set_load -pin_load 4.0 [get_ports ramsn_4_]
set_load -pin_load 4.0 [get_ports ramsn_3_]
set_load -pin_load 4.0 [get_ports ramsn_2_]
set_load -pin_load 4.0 [get_ports ramsn_1_]
set_load -pin_load 4.0 [get_ports ramsn_0_]
set_load -pin_load 4.0 [get_ports ramoen_4_]
set_load -pin_load 4.0 [get_ports ramoen_3_]
set_load -pin_load 4.0 [get_ports ramoen_2_]
set_load -pin_load 4.0 [get_ports ramoen_1_]
set_load -pin_load 4.0 [get_ports ramoen_0_]
set_load -pin_load 4.0 [get_ports romsn_1_]
set_load -pin_load 4.0 [get_ports romsn_0_]
set_load -pin_load 4.0 [get_ports iosn]
set_load -pin_load 4.0 [get_ports oen]
set_load -pin_load 4.0 [get_ports read]
set_load -pin_load 4.0 [get_ports sdcsn_1_]
set_load -pin_load 4.0 [get_ports sdcsn_0_]
set_load -pin_load 4.0 [get_ports sdwen]
set_load -pin_load 4.0 [get_ports sdrasn]
set_load -pin_load 4.0 [get_ports sdcasn]
set_load -pin_load 4.0 [get_ports sddqm_3_]
set_load -pin_load 4.0 [get_ports sddqm_2_]
set_load -pin_load 4.0 [get_ports sddqm_1_]
set_load -pin_load 4.0 [get_ports sddqm_0_]
set_load -pin_load 4.0 [get_ports dsutx]
set_load -pin_load 4.0 [get_ports dsuact]
set_load -pin_load 4.0 [get_ports g3281909_u0_o]
set_load -pin_load 4.0 [get_ports g3281505_u0_o]
set_load -pin_load 4.0 [get_ports g3282010_u0_o]
set_load -pin_load 4.0 [get_ports g3281808_u0_o]
set_load -pin_load 4.0 [get_ports g3281707_u0_o]
set_load -pin_load 4.0 [get_ports g3281606_u0_o]
set_load -pin_load 4.0 [get_ports g3282212_u0_o]
set_load -pin_load 4.0 [get_ports g3282111_u0_o]
set_load -pin_load 4.0 [get_ports g3285446_u0_o]
set_load -pin_load 4.0 [get_ports g3285611_u0_o]
set_load -pin_load 4.0 [get_ports g3285776_u0_o]
set_load -pin_load 4.0 [get_ports g3285281_u0_o]
set_load -pin_load 4.0 [get_ports g3284951_u0_o]
set_load -pin_load 4.0 [get_ports g3286601_u0_o]
set_load -pin_load 4.0 [get_ports g3285116_u0_o]
set_load -pin_load 4.0 [get_ports g3284621_u0_o]
set_load -pin_load 4.0 [get_ports g3284456_u0_o]
set_load -pin_load 4.0 [get_ports g3284291_u0_o]
set_load -pin_load 4.0 [get_ports g3284126_u0_o]
set_load -pin_load 4.0 [get_ports g3286436_u0_o]
set_load -pin_load 4.0 [get_ports g3286271_u0_o]
set_load -pin_load 4.0 [get_ports g3286106_u0_o]
set_load -pin_load 4.0 [get_ports g3281404_u0_o]
set_load -pin_load 4.0 [get_ports g3285941_u0_o]
set_load -pin_load 4.0 [get_ports rwen_pad_3_giop0_pad_tri_u1_o]
set_load -pin_load 4.0 [get_ports rwen_pad_0_giop0_pad_tri_u1_o]
set_load -pin_load 4.0 [get_ports rwen_pad_2_giop0_pad_tri_u1_o]
set_load -pin_load 4.0 [get_ports writen_pad_giop0_pad_tri_u1_o]
set_load -pin_load 4.0 [get_ports rwen_pad_1_giop0_pad_tri_u1_o]
set_load -pin_load 4.0 [get_ports g3228100_u0_o]
