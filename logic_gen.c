#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

#include <search.h>

#define __ILLEGAL_FILE__ 1
#define __ILLEGAL_CHAR__ 2
#define __UNMATCHED_COL__ 3

#define __MAX_LEVEL__ 3


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

typedef void *BINARY_TREE_NODE ;
typedef struct _sig_knob_set{
	/* should be equal to the index of the array to store these sets */
	int signal_number ;
	/* these sensors ANDed together will turn on the signal */
	/* sensors_set is the pointer pointing to the root */
	BINARY_TREE_NODE sensors_set ;
	/* these signals dominates this signal */
	BINARY_TREE_NODE signals_set ;
	/* the minimum cost of knobs on to cover all included sensors for this signal 
	int min_cost_of_knob ; */
	int knobs[__MAX_LEVEL__] ;
	/* number of knobs */
	int nknobs ;
} sig_knob_set, *SIG_KNOB_SET ;

int int_cmp(const void *a, const void *b){
	if( *(int *)a < *(int *)b){
		return -1;
	}else if( *(int *) a == *(int *)b ){
		return 0;
	}else{
		return 1;
	}
}
int combination_gen(void *temp_mat, int nrow, int ncol, int *sorted_index) {
	int i , j;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	SIG_KNOB_SET sks_arr = NULL ;

	
	for(i = 0; i < nrow; i++){
		for (j = 0; j < ncol; j++){

		if(mat[ sorted_index[i] ][j] == 1){
			
		}
	



		}
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
