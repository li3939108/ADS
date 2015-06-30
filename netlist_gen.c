#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <search.h>

#include "struct.h"

void sig2gates(char *keys[__MAX_NUMBER_OF_SIGNALS__], int nkeys){
	int i = 0;
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found\n");
			exit(EXIT_FAILURE) ;
		}else{
		
		int j ;
		SIG_KNOB sk = et->data ;
		fprintf(stdout, "and sgg%d(sg%s,", i, sk->signal_key);
		for (j = 0; j < sk->nsensors ; j++){
			if(j != sk->nsensors - 1) {
				fprintf(stdout, "sensor%d, ", sk->sensors_index_list[j] );
			}else{
				fprintf(stdout, "sensor%d", sk->sensors_index_list[j] );
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

void isig2gates(char *keys[], int nkeys){
	int i = 0;
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found\n");
			exit(EXIT_FAILURE) ;
		}else {

		int j;
		SIG_KNOB sk= et->data;
		if(sk->ndominated_sig > 0){
			fprintf(stderr, "not notsgg%d(notsg%s, sg%s);\n", i, sk->signal_key, sk->signal_key) ;
		}
		if(sk->significant == 0){
			continue;
		}
		fprintf(stdout, "and isgg%d(isg%s, sg%s, ", i, 
			sk->signal_key, sk->signal_key);
		for( j =0; j < sk->ndominating_sig; j++){
			if(j != sk->ndominating_sig - 1) {
				fprintf(stdout, "notsg%s, ", sk->dominating_signal[j]->signal_key ) ;
			}else{
				fprintf(stdout, "notsg%s", sk->dominating_signal[j]->signal_key ) ;
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
