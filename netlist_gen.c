#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <search.h>

#include "struct.h"

//#define NOT_GATE "INV_X1"

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
		fprintf(stdout, "and sgg%dlevel%d(sg%s_level%d,", i, level, sk->signal_key, level);
		for (j = 0; j < sk->nsensors ; j++){
			if(j != sk->nsensors - 1) {
				fprintf(stdout, "sensor%d_level%d, ", sk->sensors_index_list[j] , level);
			}else{
				fprintf(stdout, "sensor%d_level%d", sk->sensors_index_list[j], level );
			}
		}
		if(j == 1){
			fprintf(stdout, ", VDD);\n");
		}else{
			fprintf(stdout, ");\n");
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
			fprintf(stderr, "not notsgg%d_level%d(notsg%s_level%d, sg%s_level%d);\n", 
				i, level, sk->signal_key, level, sk->signal_key, level) ;
		}
		if(sk->significant == 0){
			continue;
		}
		fprintf(stdout, "and isgg%d_level%d(isg%s_level%d, sg%s_level%d, ", i, level,
			sk->signal_key, level, sk->signal_key, level);
		for( j =0; j < sk->ndominating_sig; j++){
			if(j != sk->ndominating_sig - 1) {
				fprintf(stdout, "notsg%s_level%d, ", sk->dominating_signal[j]->signal_key , level) ;
			}else{
				fprintf(stdout, "notsg%s_level%d", sk->dominating_signal[j]->signal_key , level) ;
			}
		}
		if(j == 0){
			fprintf(stdout, "VDD);\n") ;
		}else{
			fprintf(stdout, ");\n") ;
		}



		}
	}	
}
