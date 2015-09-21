#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <search.h>

#include "struct.h"

#define NOT_GATE "INV_X1"

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
			}else{
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d( .ZN(sg%s_level%d),",sk->nsensors, i, level, sk->signal_key, level);
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
				for (j = 0; j < 4; j++){
					if(j != 4) {
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
				for(k = 0; k < factor; k++){
					if(k != factor - 1 ) { 
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d), ", k+2, sk->signal_key, k, level); 
					}else{
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d)); \n", k+2, sk->signal_key, k, level); 
					}
				}
			}else if( remaining_sensors == 0){
				fprintf(stdout, "AND%d_X1 sgg%dlevel%d(.ZN(sg%s_level%d), ", factor, i, level, sk->signal_key, level) ;
				for(k = 0; k < factor; k++){
					if(k != factor - 1 ) { 
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d), ", k+1, sk->signal_key, k, level); 
					}else{
						fprintf(stdout, ".A%d(sg%s_factor%d_level%d)); \n", k+1, sk->signal_key, k, level); 
					}
				}
			}else{
				if(remaining_sensors != 1){
					fprintf(stdout, "AND%d_X1 sgg%dlevel%d( .ZN(sg%s_factor%d_level%d),",remaining_sensors, i, level, sk->signal_key, factor, level);
				}else{
					fprintf(stdout, "AND%d_X1 sgg%dlevel%d( .ZN(sg%s_factor%d_level%d),",2, i, level, sk->signal_key, factor, level);
				}
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
		if(sk->ndominated_sig > 0){
			fprintf(stdout, "%s notsgg%d_level%d(notsg%s_level%d, sg%s_level%d);\n", NOT_GATE,
				i, level, sk->signal_key, level, sk->signal_key, level) ;
		}
		if(sk->significant == 0){
			continue;
		}
		if( sk->ndominated_sig == 0){
			fprintf(stdout, "AND%d_X1 isgg%d_level%d(.ZN(isg%s_level%d), .A1(sg%s_level%d), ",2 ,i, level,
			sk->signal_key, level, sk->signal_key, level);
		}else{
			fprintf(stdout, "AND%d_X1 isgg%d_level%d(.ZN(isg%s_level%d), .A1(sg%s_level%d), ",sk->ndominated_sig+1 ,i, level,
			sk->signal_key, level, sk->signal_key, level);
		}
		for( j =0; j < sk->ndominated_sig; j++){
			if(j != sk->ndominated_sig - 1) {
				fprintf(stdout, ".A%d(notsg%s_level%d), ",j+2, sk->dominated_signal[j]->signal_key , level) ;
			}else{
				fprintf(stdout, ".A%d(notsg%s_level%d)", j+2,sk->dominated_signal[j]->signal_key , level) ;
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
