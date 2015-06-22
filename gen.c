#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <search.h>

#define __ILLEGAL_FILE__ 1
#define __ILLEGAL_CHAR__ 2
#define __UNMATCHED_COL__ 3
#define __MAX_NUMBER_OF_SIGNALS__ (1<<16)

#define __MAX_LEVEL__ 3
/* The max number of characters for a signal key */
#define __MAX_SIGNAL_KEY__ (1<<10)


#define DEBUG 

static char *keys[__MAX_SIGNAL_KEY__] = {NULL}; 
static int nkeys = 0 ;

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

typedef struct _sig_knob{
	/* should be equal to the index of the array to store these sets */
	char *signal_key ;
	/* these sensors ANDed together will turn on the signal */
	/* sensors_set is the pointer pointing to the root 
	BINARY_TREE_NODE sensors_set ;*/
	int significant ;
	/* min cost equivalent signals set */
	char **signals_set_list_node;
	struct _sig_knob *dominating_signal ;
	unsigned int min_cost ;
	/* the minimum cost of knobs on to cover all included sensors for this signal 
	int min_cost_of_knob ; */
	int knobs[__MAX_LEVEL__] ;
	/* number of knobs */
	int nknobs ;
} sig_knob, *SIG_KNOB ;

SIG_KNOB sk_gen(
	int sensors_index_list[], 
	int nsensors,
	int knob){
	int i = 0;
	char *signal_key = malloc (__MAX_SIGNAL_KEY__);
	char buf[__MAX_SIGNAL_KEY__] ;
	signal_key[0] = '\0' ;

	SIG_KNOB ret = malloc(sizeof *ret) ;
	memset(ret, 0, sizeof *ret) ;
	
	ret->knobs[0] = knob ;	
	ret->nknobs = 1;
	/* add a knob */
	/* binary tree NULLed */
	ret->signals_set_list_node = NULL ;
	ret->dominating_signal = NULL ;
	ret->min_cost = -1 ;
	for(i = 0; i < nsensors; i++){
		if(i != nsensors - 1){
			sprintf(buf, "%dx", sensors_index_list[i] );
		}else{
			sprintf(buf, "%d", sensors_index_list[i] );
		}
		strcat(signal_key, buf) ;
	}
	ret->significant = 0 ;
	ret->signal_key = signal_key;
	return ret ;
}



void recursive_signal_gen(
	int *sensors_index_list, int nsensors, SIG_KNOB sk_tree, 
	int knob_index, int position, int cost[] ){

	int i, min_cost;

	if(nsensors == 0){
		return ;
	}else{

	SIG_KNOB sk = sk_gen(sensors_index_list, nsensors, knob_index);
	SIG_KNOB _sk = NULL ;

	ENTRY item, *ret ;
	item.key = sk->signal_key ;
	item.data = (void *)sk ;
	
	if(NULL == (ret = hsearch (item, ENTER) ) ){
		fprintf(stderr, "hash table insert failed\n");
		exit(EXIT_FAILURE) ;
	}else if(ret->key == item.key){
		keys [ nkeys ] = item.key ; nkeys += 1;
		#ifdef DEBUG
		fprintf(stderr, "%s insterted \n", item.key);
		#endif
	}else {
		#ifdef DEBUG
		fprintf(stderr, "%s exists \n", item.key);
		#endif
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
void signal_gen(void *temp_mat, int nrow, int ncol, int sorted_index[], int cost[]) {
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
		recursive_signal_gen(sensors_index_list, nsensors, sk_tree, sorted_index[i], 0, cost);
		free(sensors_index_list) ;
		sensors_index_list = NULL ;
		nsensors = 0;
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
int main(){
	FILE *fp = fopen("input", "r") ;
	int nrow, ncol ;
	/* convert the pointer to multidimensional array */
	char *temp_mat =  get_matrix(fp, &nrow, &ncol) ;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	
	int index[ncol],i ;
	int cost[nrow] ;

	int max_col ;

	ENTRY *et  ;

	
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

	signal_gen(temp_mat, nrow, ncol, index, cost) ;
	for( i = 0; i < nkeys ; i++){
		ENTRY e={ keys[i], NULL};
		et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "nothing found \n") ;
		}else{
			fprintf(stderr, "key: %s, knob: %d\n", ( (SIG_KNOB )(et->data))->signal_key, ( (SIG_KNOB )(et->data))->knobs[0]) ;
		}
	}
	#endif

	fclose(fp) ;
}
