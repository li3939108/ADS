*********************************
*
*   Chaofan Li <chaof@tamu.edu> 
*
*********************************
.TEMP 25
.PARAM Voltage = 1.1
.LIB '45nm.sp' NOMINAL

.INC 'INV_X2.sp'
.INC 'INV_X8.sp'
.INC 'INV_X32.sp'
*****************

*****************
.SUBCKT INV_3 I1 O1 O2 vdd 0
.PARAM
+	WN=0.415U WP=0.63U
+	L_NORM=0.045U L_G=0.045U
X2 (I1 O1 vdd 0) INV_X2
+	WN=WN WP=WP
+	L=L_NORM
X8 (O1 O2 vdd 0) INV_X8 
+	WN=WN	WP=WP
+	L=L_NORM
X32 (O2 O3 vdd 0) INV_X32 
+	WN=WN	WP=WP 
+	L=L_NORM
.ENDS
*****************

*****************
.OPTION MODMONTE=0
X (I1 O1 O2 vdd 0) INV_3 L_G=GAUSS(L_NORM, 0.15, 3)
VSOURCE (vdd 0)
+	DC Voltage
Vpulse (I1 0)
+ 	PULSE(0 1.1 10N 0.1p 0.1p 4N 8N)
*****************

.TRAN 0.5P 30N SWEEP MONTE=20 FIRSTRUN=1
.MEASURE TRAN DELAY1
+	TRIG V(I1) VAL = .5*Voltage RISE=1
+	TARG V(O1) VAL = .5*Voltage FALL=1
*+	PRINT = 0
.MEASURE TRAN DELAY2
+	TRIG V(O1) VAL = .5*Voltage FALL=1
+	TARG V(o2) VAL = .5*Voltage RISE=1
*+	PRINT = 0
.MEASURE TRAN DELAY3
+	TRIG V(I1) VAL = .5*Voltage FALL=1
+	TARG V(O1) VAL = .5*Voltage RISE=1
*+	PRINT = 0
.MEASURE TRAN DELAY4
+	TRIG V(O1) VAL = .5*Voltage RISE=1
+	TARG V(o2) VAL = .5*Voltage FALL=1
*+	PRINT = 0
.MEASURE TRAN avgpower AVG power from=1n to=9n
.PRINT DELAY1 DELAY2 DELAY3 DELAY4 avgpower
*****************

*.ALTER case 2: Low vdd
*.LIB '45nm.sp' LOW


*.ALTER case 3: High vdd
*.LIB '45nm.sp' HIGH
*.PARAM Voltage = 1.25

*.ALTER case 4: High vdd Low TEMP
*.LIB '45nm.sp' HIGH
*.PARAM Voltage = 1.25 
*.TEMP 0

.END
