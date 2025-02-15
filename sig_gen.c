#define _GNU_SOURCE
#define _ISOC99_SOURCE      /* See feature_test_macros(7) */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <search.h>

#include "struct.h"

char *keys[__MAX_NUMBER_OF_SIGNALS__] = {NULL}; 
int nkeys = 0 ;

#define DEBUG 

extern void sig2gates(char *keys[__MAX_NUMBER_OF_SIGNALS__], int nkeys, int level ); 
extern void isig2gates(char *keys[], int nkeys, int level) ;
extern void or_isig_gates(char *keys[], int nkeys, int nrow);
extern void inputs(int ncolumn); 
extern void wires_gen();
extern void outputs_gen();

int key_nsensors_cmp(const void *a, const void *b){
	ENTRY ea = {*(char * const *)a, NULL}, eb = {*(char * const *)b, NULL}, *ar, *br ;
	ar = hsearch(ea, FIND) ; br = hsearch(eb, FIND) ;
	if(ar == NULL ){
		fprintf(stderr, "unexpected NULL search result for %s\n", ea.key) ;
		exit(EXIT_FAILURE);
	}else if(br == NULL ){
		fprintf(stderr, "unexpected NULL search result for %s\n", eb.key) ;
		exit(EXIT_FAILURE);
	}else{
		SIG_KNOB sk_a = ar->data, sk_b = br->data ;
		if(sk_a->nsensors < sk_b->nsensors){
			return -1;
		}else if(sk_a->nsensors == sk_b->nsensors){
			return 0;
		}else{
			return 1;
		}
	}
}


int dfs_check(SIG_KNOB sk, int level, SIG_KNOB sk_to_ckeck){
	
	if(strcmp( sk->signal_key , sk_to_ckeck->signal_key ) == 0){
		return 1 ;
	}else {
		int  i;
		for( i = 0; i < sk->ndominating_sig; i++){
			if( dfs_check(sk->dominating_signal[i], level + 1, sk_to_ckeck) == 1){
				return 1;
			}
		}
		return 0;
	}
}

/* sk dominates dd_sk */
void sk_update_dominated_sig(SIG_KNOB sk, SIG_KNOB dd_sk){
	int i ;
	if(sk == NULL || dd_sk == NULL){return ;}
	#ifdef DEBUG
	fprintf(stderr, "dominating updated: %s -> %s\n", sk->signal_key, dd_sk->signal_key) ;
	#endif
	for(i = 0; i < sk->ndominated_sig ; i++){
		if(sk->dominated_signal[i]->signal_key == dd_sk->signal_key ) { return ;}
	}
	sk->dominated_signal = realloc(sk->dominated_signal, (sk->ndominated_sig + 1) * sizeof *sk->dominated_signal) ;
	sk->dominated_signal[sk->ndominated_sig] = dd_sk ;
	sk->ndominated_sig += 1;
}

/* d_sk dominates sk */
void sk_update_dominating_sig(SIG_KNOB sk, SIG_KNOB d_sk){
		int i ;
		if(sk == NULL|| d_sk == NULL){return ;}
		#ifdef DEBUG
		fprintf(stderr, "dominating updated: %s <- %s\n", sk->signal_key, d_sk->signal_key) ;
		#endif
		for(i = 0; i < sk->ndominating_sig ; i++){
			if(sk->dominating_signal[i]->signal_key == d_sk->signal_key ) { return ;}
		}
		sk->dominating_signal = realloc(sk->dominating_signal, (sk->ndominating_sig + 1) * sizeof *sk->dominating_signal) ;
		sk->dominating_signal[sk->ndominating_sig] = d_sk ;
		sk->ndominating_sig += 1;
}
void remove_dominated_sig(SIG_KNOB sk, SIG_KNOB sk_to_remove){
	int i,j=0 ;
	SIG_KNOB *dominated_signal = malloc( (sk->ndominated_sig - 1) * sizeof *dominated_signal ) ;
	
	for(i = 0; i < sk->ndominated_sig ; i++){
		if(sk->dominated_signal[i] == sk_to_remove){
			continue ;
		}else{
			dominated_signal[j] = sk->dominated_signal[i] ;
			j++ ;
		}
	} free(sk->dominated_signal ) ;
	sk->dominated_signal = dominated_signal ;
	fprintf(stderr, "remove_dominated : %s(%d) - %s\n", sk->signal_key, sk->ndominated_sig, sk_to_remove->signal_key ) ;
	sk->ndominated_sig = sk->ndominated_sig  - 1;
	//fprintf(stderr, "dominated: %s %s \n", sk->dominated_signal[0]->signal_key, sk->dominated_signal[1]->signal_key ) ;
}

void remove_dominating_sig(SIG_KNOB sk, SIG_KNOB sk_to_remove){
	int i,j=0 ;
	SIG_KNOB *dominating_signal = malloc( (sk->ndominating_sig - 1) * sizeof *dominating_signal ) ;
	
	for(i = 0; i < sk->ndominating_sig ; i++){
		if(sk->dominating_signal[i] == sk_to_remove){
			continue ;
		}else{
			dominating_signal[j] = sk->dominating_signal[i] ;
			j++ ;
		}
	}
	free(sk->dominating_signal ) ;
	sk->dominating_signal = dominating_signal ;
	sk->ndominating_sig = sk->ndominating_sig - 1 ;
}
int check_existing(SIG_KNOB sk, int j, int level, int min_cost_knob_list[]){
	int k = 0;
	while( sk->dominated_signal[j]->knobs[level] != min_cost_knob_list[k ] 
	&& min_cost_knob_list[k] != -1) {
		k++;
	}
	return k ;
}
void sk_chain_pruning(float const cost[], int level ){
	int i, j;
	qsort(keys, nkeys, sizeof (char *), key_nsensors_cmp) ;
	for (i = 0; i < nkeys; i++){

	ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
	if(et == NULL){
		fprintf(stderr, "nothing found in table\n") ;
		exit(EXIT_FAILURE);
	}else{
		SIG_KNOB sk =  et->data;
		int l = level ;
		while(l > 0){
			sk = sk->next_level ;
			if(sk == NULL ){
				fprintf(stderr, "Specified level doesn\'t exist\n");
				exit(EXIT_FAILURE) ;
			}
			l -= 1 ;
		}
		if(sk->nsensors == 1) {continue ;}else{
			
			int dominated_level = 0, self_level = 0 ;
			int nmin_cost_knobs = 0;
		

			int *min_cost_knob_list = malloc(sk->ndominated_sig * sizeof * min_cost_knob_list) ;
			float min_c = 0.0;
			memset(min_cost_knob_list, (char)-1, sk->ndominated_sig * sizeof * min_cost_knob_list );
			for(j = 0; j < sk->ndominated_sig; j ++){
				int k = check_existing(sk, j, dominated_level, min_cost_knob_list);
				if(k == -1){

				}else if(min_cost_knob_list[k] == -1){
					min_cost_knob_list[k] = sk->dominated_signal[j]->knobs[dominated_level] ;
					nmin_cost_knobs = k + 1; 
				}else{ continue; }
			}
			for (j = 0; j < nmin_cost_knobs; j++){
				if(min_cost_knob_list[j] != -1){
					min_c += cost [ min_cost_knob_list[j] ];
				}else{
					min_c +=  INFINITY ;
				}
			}
			#ifdef DEBUG
			fprintf(stderr, "self_level: %d, dominated_level: %d, sig:%s ,min_c: %f, cost: %f, nmin_knobs:%d\n", 
				self_level, dominated_level, keys[i], min_c, cost[ sk->knobs[self_level] ], nmin_cost_knobs ) ;
			#endif
			if( (min_c < cost [ sk->knobs[ self_level ] ]) 	
			//	||	(min_c == cost[ sk->knobs[ self_level ] ] && nmin_cost_knobs == 1 && min_cost_knob_list[0] == sk->knobs[self_level]) 
				){
				int i = 0, j;
				for(	j = 0; j < sk->ndominating_sig; j++){
					remove_dominated_sig ( sk->dominating_signal[j], sk ) ;
				}
				for ( i = 0; i < sk->ndominated_sig; i++){
					remove_dominating_sig ( sk->dominated_signal[i], sk ) ;
				}
				for (j = 0; j < sk->ndominating_sig; j++){

					for (i = 0; i < sk->ndominated_sig; i++){
				
					if(dfs_check(sk->dominated_signal[i], 0, sk->dominating_signal[j]) ){
						/* There is another path from i -> some other node -> j */
					}else{
						sk_update_dominating_sig(sk->dominated_signal[i] , sk->dominating_signal[j] ) ;
						sk_update_dominated_sig(sk->dominating_signal[j] , sk->dominated_signal[i] ) ;
					}

					}
				}
				sk->significant = 0 ;		
				sk->ndominating_sig = 0;
				free(sk->dominating_signal ) ;
				sk->dominating_signal = NULL ;
			
				sk->ndominated_sig = 0 ;
				free(sk->dominated_signal ) ;
				sk->dominated_signal =NULL ;
				if( (min_c == cost[ sk->knobs[ self_level ] ] && nmin_cost_knobs == 1 && min_cost_knob_list[0] == sk->knobs[self_level]) ){
					self_level += 1 ;
				}
				dominated_level += 1 ;
				#ifdef DEBUG
				fprintf(stderr, "free : %s\n", sk->signal_key ) ;
				#endif
			}else{
				self_level += 1 ;
			}
			free(min_cost_knob_list);
		}

	}
		
	}
}

char * get_matrix(FILE *input, int *m, int *n){
	if(input == NULL){

	perror("illegal file");
	exit(EXIT_FAILURE);

	}else{

	int ncol = -1;
	int nrow = -1;
	int col_counter = 0;
	int row_counter = 0;
	char *ret = malloc(1);
	int cur_size ;
	char c = '\0' ;
	do {
		c = getc(input) ;
		switch(c){
		case '0':
		case '1':
		col_counter += 1;
		cur_size = row_counter * ncol + col_counter ;
		ret = realloc(ret, cur_size * sizeof *ret ) ;
		ret[cur_size - 1] = (char) (c - '0') ;
		break;
		
		case ',':
		case ' ':
		case '\t':
		break;

		case '\n':
		case EOF:
		if(col_counter == 0){
		}else if(ncol == -1){
			ncol = col_counter ;
			row_counter += 1 ;
			col_counter = 0 ;
		}else if(col_counter == ncol){
			row_counter += 1 ;
			col_counter = 0 ;
		}else{
			fprintf(stderr, 
				"unmatched column number at row %d\n",
				 row_counter) ;
			exit(EXIT_FAILURE);
		}
		if (c == EOF) {nrow = row_counter ;}
		break;
		
		default:
		fprintf(stderr, "illegal character: %c\n", c);
		exit(EXIT_FAILURE);
		break;
		}
	} while(c != EOF) ;
	*m = nrow; *n = ncol ;	
	return ret ;

	}
}
SIG_KNOB sk_add_knob(SIG_KNOB sk, int knob_index){
	int i;
	if(sk->nknobs > __MAX_LEVEL__){
		fprintf(stderr, "too many levels, illegal matrix");
		exit(EXIT_FAILURE) ;
	}else if(sk->nknobs == __MAX_LEVEL__ ){
		if(sk->knobs[sk->nknobs - 1] != knob_index){
			fprintf(stderr, "too many levels, illegal matrix");
			exit(EXIT_FAILURE) ;
		}
	}else{
		if(sk->knobs[sk->nknobs - 1] != knob_index){
			sk->knobs[sk->nknobs] = knob_index ;
			sk->nknobs += 1 ;
		}
	}
	return sk ;

}

SIG_KNOB sk_gen(
	int sensors_index_list[], 
	int nsensors,
	int knob_index,
	float cost[]){

	SIG_KNOB ret = malloc(sizeof *ret) ;
	int i = 0;
	char *signal_key = malloc (__MAX_SIGNAL_KEY__);
	char buf[__MAX_SIGNAL_KEY__] ;

	memset(ret, 0, sizeof *ret) ;
	memset(signal_key, 0, __MAX_SIGNAL_KEY__ * sizeof *signal_key) ;
	/* set all knobs to -1 */
	memset(ret->knobs, (char)-1, __MAX_LEVEL__ * sizeof(int) ) ;
	
	ret->sensors_index_list = malloc(nsensors * sizeof *sensors_index_list) ;
	ret->nsensors = nsensors ;
	memcpy(ret->sensors_index_list, sensors_index_list, nsensors * sizeof *sensors_index_list) ;

	ret->signal_key = signal_key;
	ret->knobs[0] = knob_index ;	
	ret->nknobs = 1;

	for(i = 0; i < nsensors; i++){
		if(i != nsensors - 1){
			sprintf(buf, "%dx", sensors_index_list[i] );
		}else{
			sprintf(buf, "%d", sensors_index_list[i] );
		}
		strcat(ret->signal_key, buf) ;
	}

	ret->dominated_signal = NULL ;
	ret->ndominated_sig = 0 ;

	ret->dominating_signal = NULL ;
	ret->ndominating_sig = 0 ;

	ret->significant = 1 ;

	ret->next_level = NULL ;
	return ret ;
}

void add_next_level(char *keys[], int nkeys, float cost[]){
	int i;
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found in table\n")	 ;
			exit(EXIT_FAILURE);
		}else{
			SIG_KNOB sk =  et->data, skn = NULL ; 
			while(sk->next_level != NULL){
				sk = sk->next_level ;
			}
			skn = (sk->next_level = sk_gen(sk->sensors_index_list, sk->nsensors, sk->knobs[0], cost ) );
		}
	}
	for(i = 0; i < nkeys; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found in table\n")	 ;
			exit(EXIT_FAILURE);
		}else{
			SIG_KNOB sk =  et->data, skn = sk->next_level ; 
			while(skn->next_level != NULL){
				skn = skn->next_level ;
			}
			int i ;
			for(i = 0; i < sk->ndominating_sig; i++){
				sk_update_dominating_sig(skn, sk->dominating_signal[i]->next_level) ;
			}
			skn->ndominating_sig = sk->ndominating_sig ;
			for(i = 0; i < sk->ndominated_sig; i++){
				sk_update_dominated_sig(skn, sk->dominated_signal[i]->next_level);
			}
			skn->ndominated_sig = sk->ndominated_sig;
			for(i = 1; i < sk->nknobs; i++){
				sk_add_knob(skn, sk->knobs[i] ) ;
			}
		}
	}
}



void sk_free(SIG_KNOB sk){

	free(sk->sensors_index_list) ;
	free(sk->signal_key);
	free(sk->dominating_signal);
	free(sk->dominated_signal) ;
	if(sk->next_level != NULL){
		sk_free(sk->next_level) ;
	}
	free(sk) ;
}

void recursive_signal_gen(
	int *sensors_index_list, int nsensors, SIG_KNOB sk_tree, 
	int knob_index, int position, float cost[], SIG_KNOB dominating_signal ){

	int i;

	if(nsensors == 0){
		return ;
	}else{

	SIG_KNOB sk = sk_gen(sensors_index_list, nsensors, knob_index, cost);

	ENTRY item, *ret ;
	item.key = sk->signal_key ;
	item.data = (void *)sk ;
	
	if(NULL == (ret = hsearch (item, ENTER) ) ){
		fprintf(stderr, "hash table insert failed\n");
		exit(EXIT_FAILURE) ;
	}else if(ret->key == item.key){
		#ifdef DEBUG
		fprintf(stderr, "%s insterted \n", item.key);
		#endif
		keys [ nkeys ] = item.key ; nkeys += 1;
		sk_update_dominating_sig(sk, dominating_signal );
		sk_update_dominated_sig(dominating_signal, sk);
	}else {
		#ifdef DEBUG
		fprintf(stderr, "%s exists \n", item.key);
		#endif
		
		sk_free(sk) ;
		sk = ret->data; 
		sk_add_knob(sk, knob_index) ;
		sk_update_dominating_sig(sk, dominating_signal );
		sk_update_dominated_sig(dominating_signal, sk);
	}
	/* recursively generate all the combinations */
	for (i = 0; i < nsensors; i++){
		int *new_sensors_index_list = malloc( ( nsensors - 1) * sizeof *new_sensors_index_list) ;
		memcpy(new_sensors_index_list, sensors_index_list, i * sizeof *sensors_index_list) ;
		memcpy(new_sensors_index_list + i, sensors_index_list + 1 + i, (nsensors - i - 1) * sizeof *sensors_index_list) ;
		recursive_signal_gen(new_sensors_index_list, nsensors - 1, sk_tree, knob_index, i, cost, sk) ;
		free(new_sensors_index_list) ;
	}

	}
}
void signal_gen(void *temp_mat, int nrow, int ncol, int sorted_index[], float cost[]) {
	int i , j;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	SIG_KNOB sk_tree = NULL ;

	hcreate(__MAX_NUMBER_OF_SIGNALS__) ;
	for(i = 0; i < nrow; i++){
		int *sensors_index_list = NULL, nsensors = 0;
		for (j = 0; j < ncol; j++){

		if(mat[ sorted_index[i] ][j] == 1){
			sensors_index_list = 
				realloc(sensors_index_list, 
				(1 + nsensors) * sizeof *sensors_index_list ) ;
			sensors_index_list[nsensors] = j ;
			nsensors += 1;
		}

		}
		#ifdef DEBUG
		fprintf(stderr, "recursive gen nsensors: %d, row:%d\n", nsensors, sorted_index[i]) ;
		#endif
		recursive_signal_gen(sensors_index_list, nsensors, sk_tree, sorted_index[i], 0, cost, NULL);
		free(sensors_index_list) ;
		sensors_index_list = NULL ;
	}
	
}
int cost_fun(FILE *input , void *mat, int nrow, int ncol, int row_number){
	int i, ret = 0 ;
	
	if(row_number < nrow){
		for ( i = 0; i < ncol; i++){
			ret += (unsigned int ) ((char (*)[ncol])mat)[row_number ][i] ;
		}
		return ret ;
	}else{
		fprintf(stderr, "specified row number %d too large", row_number);
		exit(EXIT_FAILURE) ;
	}

	
}
int cost_cmp(const void *a, const void *b, void *cost){
	if(  ( (float const *)cost)[*(int const *)a] <  ( (float const *)cost)[*(int const *)b] ){
		return -1;
	}else if( ( (float const *)cost)[*(int const *)a] == ( (float const *)cost)[*(int const *)b] ){
		return 0;
	}else{	return 1;}
}

#ifdef DEBUG
void print_keys(char *temp_mat, int nrow, int ncol, float const cost[], int const index[] , int level){
	int i, j;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	for (i = 0; i < nrow; i++){
		for(j = 0; j < ncol; j ++){
			fprintf(stderr, "%d ", mat   [ i ][j] ) ;
		}
		fprintf(stderr, "   cost is %f, sorted cost is %d\n", cost[i], index[i]) ;
	}
	//fprintf(stderr, "cost of 2 : %d\n",  cost_fun(NULL, mat, nrow, ncol, 2)) ;

	fprintf(stderr, "level %d\n\n\n", level );
	for(i = 0; i < nkeys ; i++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		SIG_KNOB sk =  et->data;
		int l = level ;
		while(l > 0){
			sk = sk->next_level ;
			if(sk == NULL ){
				fprintf(stderr, "Specified level doesn\'t exist\n");
				exit(EXIT_FAILURE) ;
			}
			l -= 1 ;
		}
		if(et == NULL){
			fprintf(stderr, "nothing found \n") ;
		}else{
			fprintf(stderr, "key: %s, knob: %d,%d,%d; #sensors: %d     sensor index:  ", sk->signal_key, 
				( (SIG_KNOB )(et->data))->knobs[0],
				( (SIG_KNOB )(et->data))->knobs[1],
				( (SIG_KNOB )(et->data))->knobs[2] ,
				sk->nsensors ) ;
			for(j = 0; j < sk->nsensors; j ++){
				fprintf(stderr, "  %d ", sk->sensors_index_list[j] ) ;
			}
			fprintf(stderr, " dominating: " );
			for(j = 0; j < sk->ndominating_sig ; j ++){
				fprintf(stderr, "%s, ", sk->dominating_signal[j]->signal_key ) ;
			}
			fprintf(stderr, "; siginificant : %d , dominated(%d): ",sk->significant, sk->ndominated_sig) ;
			for(j = 0; j < sk->ndominated_sig ; j ++){
				fprintf(stderr, "%s, ", sk->dominated_signal[j]->signal_key ) ;
			}
			fprintf(stderr, "\n") ;
		}
	}
}
#endif
void get_cost(FILE *cost_input, float *cost, int nrow){
	int  i;
	float temp ;
	if(cost_input == NULL){
		perror("no cost file");
		exit(EXIT_FAILURE);
	}
	for(i = 0; i< nrow ; i++){
		fscanf(cost_input, "%f", &temp) ;
		cost[i] = temp ;
	}
}
int main(){
	FILE *fp = fopen("mat_input", "r") ;
	FILE *cost_input = fopen("cost_input", "r") ;
	int nrow, ncol ;
	/* convert the pointer to multidimensional array */
	char *temp_mat =  get_matrix(fp, &nrow, &ncol) ;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	
	int index[ncol],i ;
	float cost_original[nrow + 1];
	float *cost = cost_original + 1 ;

	int max_col ;

	int j ;

	ENTRY *et  ;

	cost_original[0] = INFINITY ;
	
	get_cost(cost_input, cost, nrow) ;
	for(i = 0; i < nrow; i++){
//		cost[i] = cost_fun(NULL, mat, nrow, ncol, i) ;
		index[i] = i ;
	}
	qsort_r(index, nrow, sizeof *index, cost_cmp, cost) ;
	signal_gen(temp_mat, nrow, ncol, index, cost) ;
//	qsort(keys, nkeys, sizeof (char *), key_nsensors_cmp); 
//	add_next_level(keys, nkeys, cost);
	#ifdef DEBUG
	print_keys((char *)mat, nrow, ncol, cost, index, 0) ;
	#endif
	sk_chain_pruning(cost, 0) ;	
	#ifdef DEBUG
	print_keys((char *)mat, nrow, ncol, cost, index, 0) ;
	#endif
//	print_keys((char *)mat, nrow, ncol, cost, index, 1) ;
//	inputs(ncol) ;
	//sig2gates(keys, nkeys, 0) ;
//	sig2gates(keys, nkeys, 1) ;
	//isig2gates(keys, nkeys, 0) ;
//	isig2gates(keys, nkeys, 1) ;
	//or_isig_gates(keys, nkeys, nrow) ;
	//wires_gen();
	//outputs_gen();
	for( i = 0; i < nkeys ; i++){
		ENTRY e={ keys[i], NULL};
		et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found \n") ;
			exit(EXIT_FAILURE);
		}else{
			SIG_KNOB sk =  et->data;
			sk_free(et->data);
		}	
	}
	hdestroy();
	free(temp_mat);
	fclose(fp) ;
} 

