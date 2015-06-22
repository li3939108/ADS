#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <search.h>

#define __ILLEGAL_FILE__ 1
#define __ILLEGAL_CHAR__ 2
#define __UNMATCHED_COL__ 3

#define __MAX_LEVEL__ 3
/* The max number of characters for a signal key */
#define __MAX_SIGNAL_KEY__ 1024


#define DEBUG 

char * get_matrix(FILE *input, int *m, int *n){
	if(input == NULL){

	perror("illegal file");
	exit(__ILLEGAL_FILE__);

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
			exit(__UNMATCHED_COL__);
		}
		if (c == EOF) {nrow = row_counter ;}
		break;
		
		default:
		fprintf(stderr, "illegal character: %c\n", c);
		exit(__ILLEGAL_CHAR__);
		break;
		}
	} while(c != EOF) ;
	*m = nrow; *n = ncol ;	
	return ret ;

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
		exit(5) ;
	}
}
int cost_cmp(const void *a, const void *b, void *cost){
	if(  ( (int *)cost)[*(int*)a] <  ( (int *)cost)[*(int*)b] ){
		return -1;
	}else if( ( (int *)cost)[*(int*)a] == ( (int *)cost)[*(int*)b] ){
		return 0;
	}else{	return 1;}
}

typedef struct _sig_knob{
	/* should be equal to the index of the array to store these sets */
	char *signal_key ;
	/* these sensors ANDed together will turn on the signal */
	/* sensors_set is the pointer pointing to the root 
	BINARY_TREE_NODE sensors_set ;*/

	/* min cost equivalent signals set */
	struct _sig_knob *signals_set_list_node ;
	int min_cost ;

	struct _sig_knob *dominating_signal ;
	
	/* the minimum cost of knobs on to cover all included sensors for this signal 
	int min_cost_of_knob ; */
	int knobs[__MAX_LEVEL__] ;
	/* number of knobs */
	int nknobs ;
} sig_knob, *SIG_KNOB ;
int int_cmp(const void *a, const void *b){
	if( *(int *)a < *(int *)b ){
		return -1;
	}else if( *(int *)a == *(int *)b ){
		return 0;
	}else{
		return 1;
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
SIG_KNOB sk_add_sensors_set( SIG_KNOB sk, int sensors_index_list[], int nsensors){
	
	int i;
	for(i = 0;i < nsensors; i++){
		int *ptr = malloc(*ptr);
		*ptr = sensors_index_list [i ] ;
		tsearch( (void *)ptr, &(sk->sensors_set), int_cmp ); 
	}
	return sk ;
}
SIG_KNOB sk_gen(
	int sensors_index_list[], 
	int nsensors,
	/* The knob with highest priority */
	int knob_index){
	int i = 0;
	char *signal_key = malloc (__MAX_SIGNAL_KEY__);
	signal_key[0] = '\0' ;

	SIG_KNOB ret = malloc(sizeof *ret) ;

	ret->nknobs = 0;
	/* add a knob */
	ret->knobs[0] = knob_index ;
	ret->nknobs += 1 ;
	/* binary tree NULLed */
	ret->sensors_set = NULL;
	ret->signals_set = NULL ;
	for(i = 0; i < nsensors; i++){
		sprintf(signal_key, "%dx", *ptr );
	}
	ret->signal_key = signal_key;
	return ret ;
}
int sk_cmp(const void *a, const void *b){
	return strcmp( ( (SIG_KNOB)a )->signal_key,  ( (SIG_KNOB)b )->signal_key ) ;
}

/* return value is the min cost of knob combination that covers all the sensors in ``sensors_index_list'' */
int recursive_signal_gen(
	int *sensors_index_list, int nsensors, SIG_KNOB *sk_tree, 
	int knob_index, int position, int cost[] ){

	int i, min_cost;

	if(nsensors == 0){
		return ;
	}else{

	SIG_KNOB sk = sk_gen(sensors_index_list, nsensors, knob_index);
	SIG_KNOB _sk = NULL ;
	if( sk !=  (_sk = *(SIG_KNOB *)tsearch(sk, &sk_tree, sk_cmp) ) ){
		sk_add_knob(_sk, knob_index ) ;
		free(sk->signal_key );
		free(sk) ;
	}else{
		sk_add_sensors_set(sk, sensors_index_list, nsensors ) ;
	}
	/* recursively generate all the combinations */
	for (i = position; i < nsensors; i++){
		int *new_sensors_index_list = malloc( ( nsensors - 1) * sizeof *new_sensors_index_list) ;
		memcpy(new_sensors_index_list, sensors_index_list, i * sizeof *sensors_index_list) ;
		memcpy(new_sensors_index_list + i, sensors_index_list + 1 + i, (nsensors - i - 1) * sizeof *sensors_index_list) ;
		recursive_signal_gen(new_sensors_index_list, nsensors - 1, sk_tree, knob_index, i, cost) ;
	}

	}
}
int signal_gen(void *temp_mat, int nrow, int ncol, int sorted_index[], int cost[]) {
	int i , j;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	SIG_KNOB sk_tree = NULL ;

	
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
		recursive_signal_gen(sensors_index_list, nsensors, sk_tree, knob_index, 0, cost);

		}
		free(sensors_index_list) ;
		sensors_index_list = NULL ;
	}
}
int main(){
	FILE *fp = fopen("input", "r") ;
	int nrow, ncol ;
	/* convert the pointer to multidimensional array */
	char *temp_mat =  get_matrix(fp, &nrow, &ncol) ;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	
	int index[ncol],i ;
	int cost[nrow] ;

	int max_col ;

	if(ncol > (max_col = 8*sizeof(long long) ) ){
		fprintf(stderr, "number of columns exceeds maximum of %d\n", max_col);
		exit(7) ;
	}
	#ifdef DEBUG
	else{
		fprintf(stderr, "maximum number of columns is %d\n", max_col) ;
	}
	#endif
	
	for(i = 0; i < nrow; i++){
		cost[i] = cost_fun(NULL, mat, nrow, ncol, i) ;
		index[i] = i ;
	}
	qsort_r(index, nrow, sizeof *index, cost_cmp, cost) ;
	#ifdef DEBUG
	int j ;
	for (i = 0; i < nrow; i++){
		
		for(j = 0; j < ncol; j ++){
			fprintf(stderr, "%d ", mat   [ i ][j] ) ;
		}
		fprintf(stderr, "   cost is %d, sorted cost is %d\n", cost[i], index[i]) ;
	}
	fprintf(stderr, "cost of 2 : %d\n",  cost_fun(NULL, mat, nrow, ncol, 2)) ;
	#endif

	fclose(fp) ;
}
