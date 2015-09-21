module control_vga(
isg1_level0,
isg9_level0,
isg8_level0,
isg7_level0,
isg6_level0,
isg5_level0,
isg0_level0,
isg4_level0,
isg3_level0,
isg2_level0,
sensor0_level0,
sensor1_level0,
sensor2_level0,
sensor3_level0,
sensor4_level0,
sensor5_level0,
sensor6_level0,
sensor7_level0,
sensor8_level0,
sensor9_level0,
vdd);
wire 
sg1_level0,
sg9_level0,
sg8_level0,
sg7_level0,
sg6_level0,
sg5_level0,
sg0_level0,
sg4_level0,
sg3_level0,
sg2_level0,
sg8x9_level0,
sg7x9_level0,
sg7x8_level0,
sg6x9_level0,
sg6x8_level0,
sg6x7_level0,
sg5x9_level0,
sg5x8_level0,
sg5x7_level0,
sg5x6_level0,
sg0x9_level0,
sg0x8_level0,
sg0x7_level0,
sg0x6_level0,
sg0x5_level0,
sg3x4_level0,
sg2x4_level0,
sg2x3_level0,
sg7x8x9_level0,
sg6x8x9_level0,
sg6x7x9_level0,
sg6x7x8_level0,
sg5x8x9_level0,
sg5x7x9_level0,
sg5x7x8_level0,
sg5x6x9_level0,
sg5x6x8_level0,
sg5x6x7_level0,
sg0x8x9_level0,
sg0x7x9_level0,
sg0x7x8_level0,
sg0x6x9_level0,
sg0x6x8_level0,
sg0x6x7_level0,
sg0x5x9_level0,
sg0x5x8_level0,
sg0x5x7_level0,
sg0x5x6_level0,
sg2x3x4_level0,
sg6x7x8x9_level0,
sg5x7x8x9_level0,
sg5x6x8x9_level0,
sg5x6x7x9_level0,
sg5x6x7x8_level0,
sg0x7x8x9_level0,
sg0x6x8x9_level0,
sg0x6x7x9_level0,
sg0x6x7x8_level0,
sg0x5x8x9_level0,
sg0x5x7x9_level0,
sg0x5x7x8_level0,
sg0x5x6x9_level0,
sg0x5x6x8_level0,
sg0x5x6x7_level0,
sg5x6x7x8x9_factor0_level0,
sg5x6x7x8x9_level0,
sg0x6x7x8x9_factor0_level0,
sg0x6x7x8x9_level0,
sg0x5x7x8x9_factor0_level0,
sg0x5x7x8x9_level0,
sg0x5x6x8x9_factor0_level0,
sg0x5x6x8x9_level0,
sg0x5x6x7x9_factor0_level0,
sg0x5x6x7x9_level0,
sg0x5x6x7x8_factor0_level0,
sg0x5x6x7x8_level0,
sg0x5x6x7x8x9_factor0_level0,
sg0x5x6x7x8x9_factor1_level0,
sg0x5x6x7x8x9_level0;
output 
isg1_level0,
isg9_level0,
isg8_level0,
isg7_level0,
isg6_level0,
isg5_level0,
isg0_level0,
isg4_level0,
isg3_level0,
isg2_level0;
input 
sensor0_level0,
sensor1_level0,
sensor2_level0,
sensor3_level0,
sensor4_level0,
sensor5_level0,
sensor6_level0,
sensor7_level0,
sensor8_level0,
sensor9_level0,
vdd;
AND2_X1 sgg0level0( .ZN(sg1_level0),.A1(sensor1_level0), .A2(vdd));
AND2_X1 sgg1level0( .ZN(sg9_level0),.A1(sensor9_level0), .A2(vdd));
AND2_X1 sgg2level0( .ZN(sg8_level0),.A1(sensor8_level0), .A2(vdd));
AND2_X1 sgg3level0( .ZN(sg7_level0),.A1(sensor7_level0), .A2(vdd));
AND2_X1 sgg4level0( .ZN(sg6_level0),.A1(sensor6_level0), .A2(vdd));
AND2_X1 sgg5level0( .ZN(sg5_level0),.A1(sensor5_level0), .A2(vdd));
AND2_X1 sgg6level0( .ZN(sg0_level0),.A1(sensor0_level0), .A2(vdd));
AND2_X1 sgg7level0( .ZN(sg4_level0),.A1(sensor4_level0), .A2(vdd));
AND2_X1 sgg8level0( .ZN(sg3_level0),.A1(sensor3_level0), .A2(vdd));
AND2_X1 sgg9level0( .ZN(sg2_level0),.A1(sensor2_level0), .A2(vdd));
AND2_X1 sgg10level0( .ZN(sg8x9_level0),.A1(sensor8_level0), .A2(sensor9_level0));
AND2_X1 sgg11level0( .ZN(sg7x9_level0),.A1(sensor7_level0), .A2(sensor9_level0));
AND2_X1 sgg12level0( .ZN(sg7x8_level0),.A1(sensor7_level0), .A2(sensor8_level0));
AND2_X1 sgg13level0( .ZN(sg6x9_level0),.A1(sensor6_level0), .A2(sensor9_level0));
AND2_X1 sgg14level0( .ZN(sg6x8_level0),.A1(sensor6_level0), .A2(sensor8_level0));
AND2_X1 sgg15level0( .ZN(sg6x7_level0),.A1(sensor6_level0), .A2(sensor7_level0));
AND2_X1 sgg16level0( .ZN(sg5x9_level0),.A1(sensor5_level0), .A2(sensor9_level0));
AND2_X1 sgg17level0( .ZN(sg5x8_level0),.A1(sensor5_level0), .A2(sensor8_level0));
AND2_X1 sgg18level0( .ZN(sg5x7_level0),.A1(sensor5_level0), .A2(sensor7_level0));
AND2_X1 sgg19level0( .ZN(sg5x6_level0),.A1(sensor5_level0), .A2(sensor6_level0));
AND2_X1 sgg20level0( .ZN(sg0x9_level0),.A1(sensor0_level0), .A2(sensor9_level0));
AND2_X1 sgg21level0( .ZN(sg0x8_level0),.A1(sensor0_level0), .A2(sensor8_level0));
AND2_X1 sgg22level0( .ZN(sg0x7_level0),.A1(sensor0_level0), .A2(sensor7_level0));
AND2_X1 sgg23level0( .ZN(sg0x6_level0),.A1(sensor0_level0), .A2(sensor6_level0));
AND2_X1 sgg24level0( .ZN(sg0x5_level0),.A1(sensor0_level0), .A2(sensor5_level0));
AND2_X1 sgg25level0( .ZN(sg3x4_level0),.A1(sensor3_level0), .A2(sensor4_level0));
AND2_X1 sgg26level0( .ZN(sg2x4_level0),.A1(sensor2_level0), .A2(sensor4_level0));
AND2_X1 sgg27level0( .ZN(sg2x3_level0),.A1(sensor2_level0), .A2(sensor3_level0));
AND3_X1 sgg28level0( .ZN(sg7x8x9_level0),.A1(sensor7_level0), .A2(sensor8_level0), .A3(sensor9_level0));
AND3_X1 sgg29level0( .ZN(sg6x8x9_level0),.A1(sensor6_level0), .A2(sensor8_level0), .A3(sensor9_level0));
AND3_X1 sgg30level0( .ZN(sg6x7x9_level0),.A1(sensor6_level0), .A2(sensor7_level0), .A3(sensor9_level0));
AND3_X1 sgg31level0( .ZN(sg6x7x8_level0),.A1(sensor6_level0), .A2(sensor7_level0), .A3(sensor8_level0));
AND3_X1 sgg32level0( .ZN(sg5x8x9_level0),.A1(sensor5_level0), .A2(sensor8_level0), .A3(sensor9_level0));
AND3_X1 sgg33level0( .ZN(sg5x7x9_level0),.A1(sensor5_level0), .A2(sensor7_level0), .A3(sensor9_level0));
AND3_X1 sgg34level0( .ZN(sg5x7x8_level0),.A1(sensor5_level0), .A2(sensor7_level0), .A3(sensor8_level0));
AND3_X1 sgg35level0( .ZN(sg5x6x9_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor9_level0));
AND3_X1 sgg36level0( .ZN(sg5x6x8_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor8_level0));
AND3_X1 sgg37level0( .ZN(sg5x6x7_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor7_level0));
AND3_X1 sgg38level0( .ZN(sg0x8x9_level0),.A1(sensor0_level0), .A2(sensor8_level0), .A3(sensor9_level0));
AND3_X1 sgg39level0( .ZN(sg0x7x9_level0),.A1(sensor0_level0), .A2(sensor7_level0), .A3(sensor9_level0));
AND3_X1 sgg40level0( .ZN(sg0x7x8_level0),.A1(sensor0_level0), .A2(sensor7_level0), .A3(sensor8_level0));
AND3_X1 sgg41level0( .ZN(sg0x6x9_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor9_level0));
AND3_X1 sgg42level0( .ZN(sg0x6x8_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor8_level0));
AND3_X1 sgg43level0( .ZN(sg0x6x7_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor7_level0));
AND3_X1 sgg44level0( .ZN(sg0x5x9_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor9_level0));
AND3_X1 sgg45level0( .ZN(sg0x5x8_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor8_level0));
AND3_X1 sgg46level0( .ZN(sg0x5x7_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor7_level0));
AND3_X1 sgg47level0( .ZN(sg0x5x6_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0));
AND3_X1 sgg48level0( .ZN(sg2x3x4_level0),.A1(sensor2_level0), .A2(sensor3_level0), .A3(sensor4_level0));
AND4_X1 sgg49level0( .ZN(sg6x7x8x9_level0),.A1(sensor6_level0), .A2(sensor7_level0), .A3(sensor8_level0), .A4(sensor9_level0));
AND4_X1 sgg50level0( .ZN(sg5x7x8x9_level0),.A1(sensor5_level0), .A2(sensor7_level0), .A3(sensor8_level0), .A4(sensor9_level0));
AND4_X1 sgg51level0( .ZN(sg5x6x8x9_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor8_level0), .A4(sensor9_level0));
AND4_X1 sgg52level0( .ZN(sg5x6x7x9_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor7_level0), .A4(sensor9_level0));
AND4_X1 sgg53level0( .ZN(sg5x6x7x8_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor7_level0), .A4(sensor8_level0));
AND4_X1 sgg54level0( .ZN(sg0x7x8x9_level0),.A1(sensor0_level0), .A2(sensor7_level0), .A3(sensor8_level0), .A4(sensor9_level0));
AND4_X1 sgg55level0( .ZN(sg0x6x8x9_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor8_level0), .A4(sensor9_level0));
AND4_X1 sgg56level0( .ZN(sg0x6x7x9_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor7_level0), .A4(sensor9_level0));
AND4_X1 sgg57level0( .ZN(sg0x6x7x8_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor7_level0), .A4(sensor8_level0));
AND4_X1 sgg58level0( .ZN(sg0x5x8x9_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor8_level0), .A4(sensor9_level0));
AND4_X1 sgg59level0( .ZN(sg0x5x7x9_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor7_level0), .A4(sensor9_level0));
AND4_X1 sgg60level0( .ZN(sg0x5x7x8_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor7_level0), .A4(sensor8_level0));
AND4_X1 sgg61level0( .ZN(sg0x5x6x9_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor9_level0));
AND4_X1 sgg62level0( .ZN(sg0x5x6x8_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor8_level0));
AND4_X1 sgg63level0( .ZN(sg0x5x6x7_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor7_level0));
AND4_X1 sgg64factor0level0( .ZN(sg5x6x7x8x9_factor0_level0),.A1(sensor5_level0), .A2(sensor6_level0), .A3(sensor7_level0), .A4(sensor8_level0));
AND2_X1 sgg64level0(.ZN(sg5x6x7x8x9_level0), .A1(sensor4_level0), .A2(sg5x6x7x8x9_factor0_level0)); 
AND4_X1 sgg65factor0level0( .ZN(sg0x6x7x8x9_factor0_level0),.A1(sensor0_level0), .A2(sensor6_level0), .A3(sensor7_level0), .A4(sensor8_level0));
AND2_X1 sgg65level0(.ZN(sg0x6x7x8x9_level0), .A1(sensor4_level0), .A2(sg0x6x7x8x9_factor0_level0)); 
AND4_X1 sgg66factor0level0( .ZN(sg0x5x7x8x9_factor0_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor7_level0), .A4(sensor8_level0));
AND2_X1 sgg66level0(.ZN(sg0x5x7x8x9_level0), .A1(sensor4_level0), .A2(sg0x5x7x8x9_factor0_level0)); 
AND4_X1 sgg67factor0level0( .ZN(sg0x5x6x8x9_factor0_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor8_level0));
AND2_X1 sgg67level0(.ZN(sg0x5x6x8x9_level0), .A1(sensor4_level0), .A2(sg0x5x6x8x9_factor0_level0)); 
AND4_X1 sgg68factor0level0( .ZN(sg0x5x6x7x9_factor0_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor7_level0));
AND2_X1 sgg68level0(.ZN(sg0x5x6x7x9_level0), .A1(sensor4_level0), .A2(sg0x5x6x7x9_factor0_level0)); 
AND4_X1 sgg69factor0level0( .ZN(sg0x5x6x7x8_factor0_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor7_level0));
AND2_X1 sgg69level0(.ZN(sg0x5x6x7x8_level0), .A1(sensor4_level0), .A2(sg0x5x6x7x8_factor0_level0)); 
AND4_X1 sgg70factor0level0( .ZN(sg0x5x6x7x8x9_factor0_level0),.A1(sensor0_level0), .A2(sensor5_level0), .A3(sensor6_level0), .A4(sensor7_level0));
AND2_X1 sgg70factor1level0( .ZN(sg0x5x6x7x8x9_factor1_level0),.A1(sensor8_level0), .A2(sensor9_level0));
AND2_X1 sgg70level0(.ZN(sg0x5x6x7x8x9_level0), .A1(sg0x5x6x7x8x9_factor0_level0), .A2(sg0x5x6x7x8x9_factor1_level0)); 
AND2_X1 isgg0_level0(.ZN(isg1_level0), .A1(sg1_level0), .A2(vdd));
AND2_X1 isgg1_level0(.ZN(isg9_level0), .A1(sg9_level0), .A2(vdd));
AND2_X1 isgg2_level0(.ZN(isg8_level0), .A1(sg8_level0), .A2(vdd));
AND2_X1 isgg3_level0(.ZN(isg7_level0), .A1(sg7_level0), .A2(vdd));
AND2_X1 isgg4_level0(.ZN(isg6_level0), .A1(sg6_level0), .A2(vdd));
AND2_X1 isgg5_level0(.ZN(isg5_level0), .A1(sg5_level0), .A2(vdd));
AND2_X1 isgg6_level0(.ZN(isg0_level0), .A1(sg0_level0), .A2(vdd));
AND2_X1 isgg7_level0(.ZN(isg4_level0), .A1(sg4_level0), .A2(vdd));
AND2_X1 isgg8_level0(.ZN(isg3_level0), .A1(sg3_level0), .A2(vdd));
AND2_X1 isgg9_level0(.ZN(isg2_level0), .A1(sg2_level0), .A2(vdd));
endmodule

