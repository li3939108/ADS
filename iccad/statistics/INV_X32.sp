* 
* ******************************************************************************
* *                                                                            *
* *                   Copyright (C) 2004-2010, Nangate Inc.                    *
* *                           All rights reserved.                             *
* *                                                                            *
* * Nangate and the Nangate logo are trademarks of Nangate Inc.                *
* *                                                                            *
* * All trademarks, logos, software marks, and trade names (collectively the   *
* * "Marks") in this program are proprietary to Nangate or other respective    *
* * owners that have granted Nangate the right and license to use such Marks.  *
* * You are not permitted to use the Marks without the prior written consent   *
* * of Nangate or such third party that may own the Marks.                     *
* *                                                                            *
* * This file has been provided pursuant to a License Agreement containing     *
* * restrictions on its use. This file contains valuable trade secrets and     *
* * proprietary information of Nangate Inc., and is protected by U.S. and      *
* * international laws and/or treaties.                                        *
* *                                                                            *
* * The copyright notice(s) in this file does not indicate actual or intended  *
* * publication of this file.                                                  *
* *                                                                            *
* *         buildcell, v2010.08-HR32-SP3-2010-08-05 - build 1009061800         *
* *                                                                            *
* ******************************************************************************
* 
* 
* Running on brazil06.nangate.com.br for user Giancarlo Franciscatto (gfr).
* Local time is now Fri, 3 Dec 2010, 19:26:38.
* Main process id is 28033.
*
********************************************************************************
*                                                                              *
* Cellname:   INV_X32.                                                         *
*                                                                              *
* Technology: NCSU FreePDK 45nm.                                               *
* Format:     Cdl.                                                             *
*                                                                              *
* Written on brazil06.nangate.com.br for user Giancarlo Franciscatto (gfr)     *
* at 19:26:38 on Fri, 3 Dec 2010.                                              *
*                                                                              *
********************************************************************************
.SUBCKT INV_X32 A ZN VDD VSS 
*.PININFO A:I ZN:O VDD:P VSS:G 
*.EQN ZN=!A
.PARAM WN=0.415U WP=0.63U L=0.05U
M_i_0_0 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_1 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_2 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_3 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_4 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_5 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_6 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_7 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_8 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_9 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_10 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_11 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_12 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_13 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_14 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_15 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_16 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_17 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_18 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_19 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_20 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_21 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_22 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_23 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_24 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_25 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_26 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_27 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_28 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_29 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_0_30 ZN A VSS VSS NMOS_VTL W=WN L=L
M_i_0_31 VSS A ZN VSS NMOS_VTL W=WN L=L
M_i_1_0 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_1 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_2 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_3 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_4 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_5 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_6 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_7 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_8 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_9 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_10 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_11 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_12 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_13 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_14 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_15 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_16 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_17 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_18 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_19 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_20 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_21 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_22 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_23 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_24 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_25 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_26 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_27 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_28 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_29 VDD A ZN VDD PMOS_VTL W=WP L=L
M_i_1_30 ZN A VDD VDD PMOS_VTL W=WP L=L
M_i_1_31 VDD A ZN VDD PMOS_VTL W=WP L=L
.ENDS 

********************************************************************************
*
* END
*
********************************************************************************
