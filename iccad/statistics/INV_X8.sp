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
* Local time is now Fri, 3 Dec 2010, 19:24:46.
* Main process id is 28006.
*
********************************************************************************
*                                                                              *
* Cellname:   INV_X8.                                                          *
*                                                                              *
* Technology: NCSU FreePDK 45nm.                                               *
* Format:     Cdl.                                                             *
*                                                                              *
* Written on brazil06.nangate.com.br for user Giancarlo Franciscatto (gfr)     *
* at 19:24:46 on Fri, 3 Dec 2010.                                              *
*                                                                              *
********************************************************************************
.SUBCKT INV_X8 A ZN VDD VSS 
*.PININFO A:I ZN:O VDD:P VSS:G 
*.EQN ZN=!A
.PARAM WN=0.415U WP=0.63U L=0.05U 
M_i_0_0_x8_0 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_1 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_2 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_3 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_4 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_5 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_6 ZN A VSS VSS NMOS_VTL W=WN L=L 
M_i_0_0_x8_7 VSS A ZN VSS NMOS_VTL W=WN L=L 
M_i_1_0_x8_0 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_1 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_2 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_3 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_4 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_5 VDD A ZN VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_6 ZN A VDD VDD PMOS_VTL W=WP L=L 
M_i_1_0_x8_7 VDD A ZN VDD PMOS_VTL W=WP L=L 
.ENDS 

********************************************************************************
*
* END
*
********************************************************************************
