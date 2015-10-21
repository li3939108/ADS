#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <search.h>

#include "struct.h"

#define NOT_GATE "INV_X1"
static char wires[1<<16][1<<9] ;
static int  wire_ct = 0;
static char outputs[1<<10][1<<9];
static int  output_ct = 0;

void inputs(int nsensors){
	int i ;
	fprintf(stdout, "input \n");
	for(i = 0; i < nsensors; i++){
		fprintf(stdout, "sensor%d_level0,\n", i);
	}
	fprintf(stdout, "vdd;\n");
}
void sig2gates(char *keys[__MAX_NUMBER_OF_SIGNALS__], int nkeys, int level){
	int i = 0;
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found\n");
			exit(EXIT_FAILURE) ;
		}else{
		
		int j ;
		SIG_KNOB sk = et->data ;
		int l = level ;
		while(l > 0){
			sk = sk->next_level ;
			if(sk == NULL ){
				fprintf(stderr, "Specified level doesn\'t exist\n");
				exit(EXIT_FAILURE) ;
			}
			l -= 1 ;
		}
		if(sk->nsensors <= 4){
			if(sk->nsensors == 1){
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d( .ZN(sg%s_level%d),",2, i, level, sk->signal_key, level);
				sprintf(wires[wire_ct++], "sg%s_level%d", sk->signal_key, 0) ;
			}else{
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d( .ZN(sg%s_level%d),",sk->nsensors, i, level, sk->signal_key, level);
				sprintf(wires[wire_ct++], "sg%s_level%d", sk->signal_key, 0) ;
			}
			for (j = 0; j < sk->nsensors ; j++){
				if(j != sk->nsensors - 1) {
					fprintf(stdout, ".A%d(sensor%d_level%d), ", j+1, sk->sensors_index_list[j] , level);
				}else{
					fprintf(stdout, ".A%d(sensor%d_level%d)", j+1, sk->sensors_index_list[j], level );
				}
			}
			if(sk->nsensors == 1){
				fprintf(stdout, ", .A2(vdd));\n");
			}else{
				fprintf(stdout, ");\n");
			}
		}else{
			int remaining_sensors = sk->nsensors , factor = 0, j = 0, k=0;	
			while(remaining_sensors > 4){
				int j = 0;
				fprintf(stdout, "AND%d_X1 sgg%dfactor%dlevel%d( .ZN(sg%s_factor%d_level%d),",4, i, factor,level, sk->signal_key, factor, level);
				sprintf(wires[wire_ct++], "sg%s_factor%d_level%d", sk->signal_key, factor, 0) ;
				for (j = 0; j < 4; j++){
					if(j != 4 - 1) {
						fprintf(stdout, ".A%d(sensor%d_level%d), ", j +1, sk->sensors_index_list[j+ factor * 4] , level);
					}else{
						fprintf(stdout, ".A%d(sensor%d_level%d)", j+1, sk->sensors_index_list[j+ factor * 4], level );
					}
				}
				fprintf(stdout, ");\n");
				factor += 1;remaining_sensors -= 4 ;
			}
			if(remaining_sensors == 1 ){
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d(.ZN(sg%s_level%d), .A1(sensor%d_level%d), ", factor+1, i, level, sk->signal_key, level, factor*4, level) ;
				sprintf(wires[wire_ct++], "sg%s_level%d", sk->signal_key, 0) ;
				for(k = 0; k < factor; k++){
					if(k != factor - 1 ) { 
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d), ", k+2, sk->signal_key, k, level); 
					}else{
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d)); \n", k+2, sk->signal_key, k, level); 
					}
				}
			}else if( remaining_sensors == 0){
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d(.ZN(sg%s_level%d), ", factor, i, level, sk->signal_key, level) ;
				sprintf(wires[wire_ct++], "sg%s_level%d", sk->signal_key, 0) ;
				for(k = 0; k < factor; k++){
					if(k != factor - 1 ) { 
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d), ", k+1, sk->signal_key, k, level); 
					}else{
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d)); \n", k+1, sk->signal_key, k, level); 
					}
				}
			}else{
				fprintf(stdout, "AND%d_X1 sgg%dfactor%dlevel%d( .ZN(sg%s_factor%d_level%d),",remaining_sensors, i,factor, level, sk->signal_key, factor, level);
				sprintf(wires[wire_ct++], "sg%s_factor%d_level%d", sk->signal_key,factor, 0) ;
				for (j = factor * 4; j < sk->nsensors ; j++){
					if(j != sk->nsensors - 1) {
						fprintf(stdout, ".A%d(sensor%d_level%d), ", j +1 -factor*4, sk->sensors_index_list[j] ,  level);
					}else{
						fprintf(stdout, ".A%d(sensor%d_level%d)", j+1 -factor*4, sk->sensors_index_list[j ], level );
					}
				}
				if(remaining_sensors == 1){
					fprintf(stdout, ", .A2(vdd));\n");
				}else{
					fprintf(stdout, ");\n");
				}
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d(.ZN(sg%s_level%d), ", factor+1, i, level, sk->signal_key, level) ;
				sprintf(wires[wire_ct++], "sg%s_level%d", sk->signal_key, 0) ;
				for(k = 0; k <= factor; k++){
					if(k != factor ) { 
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d), ", k+1, sk->signal_key, k, level); 
					}else{
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d)); \n", k+1, sk->signal_key, k, level); 
					}
				}
			}
			
		}
			
		}
	}
}

void isig2gates(char *keys[], int nkeys, int level){
	int i = 0;
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found\n");
			exit(EXIT_FAILURE) ;
		}else {

		int j;
		SIG_KNOB sk= et->data;
		int l = level ;
		while(l > 0){
			sk = sk->next_level ;
			if(sk == NULL ){
				fprintf(stderr, "Specified level doesn\'t exist\n");
				exit(EXIT_FAILURE) ;
			}
			l -= 1 ;
		}
		if(sk->ndominating_sig > 0){
			fprintf(stdout, "%s notsgg%d_level%d(.ZN(notsg%s_level%d), .A(sg%s_level%d));\n", NOT_GATE,
				i, level, sk->signal_key, level, sk->signal_key, level) ;
			sprintf(wires[wire_ct++], "nogsg%s_level%d", sk->signal_key, 0) ;
		}
		if(sk->significant == 0){
			continue;
		}
		if( sk->ndominating_sig == 0){
			fprintf(stdout, "AND%d_X1 isgg%d_level%d(.ZN(isg%s_level%d), .A1(sg%s_level%d), ",2 ,i, level,
			sk->signal_key, level, sk->signal_key, level);
			sprintf(wires[wire_ct++], "isg%s_level%d", sk->signal_key, 0) ;
		}else{
			fprintf(stdout, "AND%d_X1 isgg%d_level%d(.ZN(isg%s_level%d), .A1(sg%s_level%d), ",sk->ndominating_sig+1 ,i, level,
			sk->signal_key, level, sk->signal_key, level);
			sprintf(wires[wire_ct++], "isg%s_level%d", sk->signal_key, 0) ;
		}
		for( j =0; j < sk->ndominating_sig; j++){
			if(j != sk->ndominating_sig - 1) {
				fprintf(stdout, ".A%d(notsg%s_level%d), ",j+2, sk->dominating_signal[j]->signal_key , level) ;
			}else{
				fprintf(stdout, ".A%d(notsg%s_level%d)", j+2,sk->dominating_signal[j]->signal_key , level) ;
			}
		}
		if(j == 0){
			fprintf(stdout, ".A2(vdd));\n") ;
		}else{
			fprintf(stdout, ");\n") ;
		}


		}
	}	
}
void or_isig_gates(char *keys[__MAX_NUMBER_OF_SIGNALS__], int nkeys,int nrow){
	int i = 0;
	SIG_KNOB *influencing_sigs[nrow];
	int length[nrow] ;
	for(i = 0; i < nrow ;i++){
		influencing_sigs[i] = malloc(sizeof (SIG_KNOB) ) ;
		influencing_sigs[i][0] = NULL ;
		length[i] = 0 ;
	}
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found\n");
			exit(EXIT_FAILURE) ;
		}else {
		
		int j;
		SIG_KNOB sk= et->data;
		if(sk->significant == 0){
			continue;
		}
		
		influencing_sigs[ sk->knobs[0] ][length[ sk->knobs[0] ] ++]  = sk ;
		influencing_sigs[ sk->knobs[0] ] = realloc(influencing_sigs[ sk->knobs[0] ] , ( length[ sk->knobs[0] ]  + 1) * sizeof (SIG_KNOB) ) ;
		influencing_sigs[ sk->knobs[0] ][length[ sk->knobs[0] ]  ] = NULL;

		}
	}

	for(i = 0; i < nrow; i++){
		if( length[i] <=  4){
			int j = 0;
			if(length[i] == 0){continue;}
			else if(length[i] == 1){
				fprintf(stdout, "AND2_X1 or%d(.ZN(output%d), .A1(isg%s_level0),.A2(vdd) ) ;\n", i, i, influencing_sigs[i][0]->signal_key );
				sprintf(outputs[output_ct++], "output%d", i) ;
			}else{
		
			fprintf(stdout, "OR_X1 or%d(.ZN(output%d), ", i, i );
			sprintf(outputs[output_ct++], "output%d", i) ;
			for (j = 0; j < length[i]; j++){
				if(j < length[i] - 1){
					fprintf( stdout, ".A%d(isg%s_level0), ", j+1, influencing_sigs[i][j]->signal_key );
				}else{
					fprintf( stdout,".A%d(isg%s_level0)) ;\n ", j+1, influencing_sigs[i][j]->signal_key );
				}
			}

			}
		}else{
			int remaining_signals = length[i] ;
			int factor = 0, j = 0, k=0;	
			while(remaining_signals > 4){
				int j = 0;
				fprintf(stdout, "OR%d_X1 or%d_factor%d(.ZN(output%d_factor%d), ",4, i, factor, i, factor);
				sprintf(wires[wire_ct++], "output%d_factor%d", i, factor) ;
				for (j = 0; j < 4; j++){
					if(j != 4 - 1) {
						fprintf(stdout, ".A%d(isg%s_level0), ", j + 1, influencing_sigs[i][j+ factor * 4]->signal_key);
					}else{
						fprintf(stdout, ".A%d(isg%s_level0)", j + 1, influencing_sigs[i][j+ factor * 4]->signal_key);
					}
				}
				fprintf(stdout, ");\n");
				factor += 1;remaining_signals -= 4 ;
			}
			if(remaining_signals == 1 ){
				fprintf(stdout, "OR%d_X1 or%d(.ZN(output%d), .A1(isg%s_level0), ", factor+1, i, i, influencing_sigs[i][ factor * 4]->signal_key) ;
				sprintf(outputs[output_ct++], "output%d", i) ;
				for(k = 0; k < factor; k++){
					if(k != factor - 1 ) { 
						fprintf(stdout, ".A%d(output%d_factor%d), ", k+2, i, k); 
					}else{
						fprintf(stdout, ".A%d(output%d_factor%d)); \n", k+2, i, k); 
					}
				}
			}else if( remaining_signals == 0){
				fprintf(stdout, "OR%d_X1 or%d(.ZN(output%d), ", factor, i, i) ;
				sprintf(outputs[output_ct++], "output%d", i) ;
				for(k = 0; k < factor; k++){
					if(k != factor - 1 ) { 
						fprintf(stdout, ".A%d(output%d_factor%d), ", k+1,i, k); 
					}else{
						fprintf(stdout, ".A%d(output%d_factor%d)); \n", k+1,i, k); 
					}
				}
			}else{
				fprintf(stdout, "OR%d_X1 or%d_factor%d( .ZN(output%d_factor%d),",remaining_signals, i, factor, i, factor);
				sprintf( wires[wire_ct++], "output%d_factor%d", i, factor) ;
				for (j = factor * 4; j < length[i] ; j++){
					if(j != length[i] - 1) {
						fprintf(stdout, ".A%d(isg%s_level0), ", j +1 -factor*4, influencing_sigs[i][j]->signal_key);
						
					}else{
						fprintf(stdout, ".A%d(isg%s_level0)", j+1 -factor*4, influencing_sigs[i][j]->signal_key );
					}
				}
				if(remaining_signals == 1){
					fprintf(stdout, ", .A2(gnd));\n");
				}else{
					fprintf(stdout, ");\n");
				}
				fprintf(stdout, "OR%d_X1 or%d(.ZN(output%d), ", factor+1, i, i) ;
				sprintf( outputs[output_ct++], "output%d", i) ;
				for(k = 0; k <= factor; k++){
					if(k != factor ) { 
						fprintf(stdout, ".A%d(output%d_factor%d), ", k+1, i, k); 
					}else{
						fprintf(stdout, ".A%d(output%d_factor%d)); \n", k+1, i, k); 
					}
				}
			}
			


		}
	}
}
void wires_gen(){
	int i;
	fprintf(stdout, "wire \n");
	for(i = 0; i < wire_ct; i++){
		if(i != wire_ct - 1){
			fprintf(stdout, "%s,\n", wires[i] ) ;
		}else{
			fprintf(stdout, "%s;\n", wires[i] ) ;
		}
	}
}
void outputs_gen(){
	int i ;
	fprintf(stdout, "output \n");
	for(i = 0; i < output_ct; i++){
		if(i != output_ct - 1){
			fprintf(stdout, "%s,\n", outputs[i] ) ;
		}else{
			fprintf(stdout, "%s;\n", outputs[i] ) ;
		}
	}
}
