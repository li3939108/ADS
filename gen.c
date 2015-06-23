#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <search.h>

#define __MAX_NUMBER_OF_SIGNALS__ (1<<16)
#define __MAX_LEVEL__ 3

/* The max number of characters for a signal key */
#define __MAX_SIGNAL_KEY__ (1<<10)


#define DEBUG 

static char *keys[__MAX_NUMBER_OF_SIGNALS__] = {NULL}; 
static int nkeys = 0 ;

static int key_nsensors_cmp(const void *a, const void *b);

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

typedef struct _sig_knob{
	/* should be equal to the index of the array to store these sets */
	char *signal_key ;
	/* these sensors ANDed together will turn on the signal */
	/* sensors_set is the pointer pointing to the root */
	int nsensors ;
	int *sensors_index_list ;
	int significant ;
	/* min cost equivalent signals set */
	char **signal_key_list ;
	int nsignals ;

	struct _sig_knob **dominating_signal ;
	int ndominating_sig ;
	struct _sig_knob **dominated_signal ;
	int ndominated_sig ;
	unsigned int min_cost ;
	/* the minimum cost of knobs on to cover all included sensors for this signal 
	int min_cost_of_knob ; */
	int knobs[__MAX_LEVEL__] ;
	/* number of knobs */
	int nknobs ;
} sig_knob, *SIG_KNOB ;

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
	int cost[], 
	SIG_KNOB dominating_signal){

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
	/* add a knob */
	/* binary tree NULLed */
	/*
	if(ret->nsensors == 1){
		ret->signal_key_list = malloc(sizeof *ret->signal_key_list) ;
		ret->signal_key_list[0] = ret->signal_key;
		ret->nsignals = 1 ;
		ret->min_cost = cost[knob_index] ;
	}else*/{
		ret->signal_key_list = NULL ;
		ret->nsignals = 0 ;
		ret->min_cost = -1 ;
	}
	for(i = 0; i < nsensors; i++){
		if(i != nsensors - 1){
			sprintf(buf, "%dx", sensors_index_list[i] );
		}else{
			sprintf(buf, "%d", sensors_index_list[i] );
		}
		strcat(ret->signal_key, buf) ;
	}
	#ifdef DEBUG
	fprintf(stderr, "dominating created: %s <- %s\n", ret->signal_key, dominating_signal == NULL ? " " : dominating_signal->signal_key) ;
	#endif

	if(dominating_signal != NULL){
		ret->dominating_signal = malloc(sizeof *ret->dominating_signal) ;
		ret->dominating_signal[0] = dominating_signal ;
		ret->ndominating_sig = 1;
		dominating_signal->dominated_signal = 
			realloc(dominating_signal->dominated_signal,
			(dominating_signal->ndominated_sig + 1) * sizeof * dominating_signal->dominated_signal) ;
		dominating_signal->dominated_signal[dominating_signal->ndominated_sig] = ret ;
		dominating_signal->ndominated_sig += 1 ;
	}else{
		ret->dominating_signal = NULL ;
		ret->ndominating_sig = 0 ;
	}

	ret->dominated_signal = NULL ;
	ret->dominated_signal = 0 ;

	ret->significant = 1 ;
	return ret ;
}
/*
void sk_update_cost(void ){
	int i ;
	qsort(keys, nkeys, sizeof (char *), key_nsensors_cmp); 

	for(i = 0; i < nkeys; i ++){
		ENTRY e={ keys[i], NULL}, *et = hsearch(e, FIND) ;
		if(et == NULL){
			fprintf(stderr, "table error, unfound key %s \n", e.key) ;
			exit(EXIT_FAILURE);
		}else {


		SIG_KNOB sk =  et->data;
		if(sk->min_cost == -1 && sk->nsignals == 0 && ret->signal_key_list == NULL){
		}else{
			continue ;
		}

		}
	}
}
*/
void sk_update_dominating_sig(SIG_KNOB sk, SIG_KNOB d_sk){
		int i ;
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

void sk_free(SIG_KNOB sk){
	free(sk->sensors_index_list) ;
	free(sk->signal_key);
	free(sk->signal_key_list);
	free(sk->dominating_signal);
	free(sk->dominated_signal) ;
	free(sk) ;
}

void recursive_signal_gen(
	int *sensors_index_list, int nsensors, SIG_KNOB sk_tree, 
	int knob_index, int position, int cost[], SIG_KNOB dominating_signal ){

	int i, min_cost;

	if(nsensors == 0){
		return ;
	}else{

	SIG_KNOB sk = sk_gen(sensors_index_list, nsensors, knob_index, cost, dominating_signal);

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
	}else {
		#ifdef DEBUG
		fprintf(stderr, "%s exists \n", item.key);
		#endif
		
		sk_free(sk) ;
		sk = ret->data; 
		sk_add_knob(sk, knob_index) ;
		sk_update_dominating_sig(sk, dominating_signal );
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
	if(  ( (int const *)cost)[*(int const *)a] <  ( (int const *)cost)[*(int const *)b] ){
		return -1;
	}else if( ( (int const *)cost)[*(int const *)a] == ( (int const *)cost)[*(int const *)b] ){
		return 0;
	}else{	return 1;}
}
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

int main(){
	FILE *fp = fopen("input", "r") ;
	int nrow, ncol ;
	/* convert the pointer to multidimensional array */
	char *temp_mat =  get_matrix(fp, &nrow, &ncol) ;
	char (*mat)[ncol] = (char (*)[ncol]) temp_mat ;
	
	int index[ncol],i ;
	int cost[nrow] ;

	int max_col ;

	int j ;

	ENTRY *et  ;

	
	for(i = 0; i < nrow; i++){
		cost[i] = cost_fun(NULL, mat, nrow, ncol, i) ;
		index[i] = i ;
	}
	qsort_r(index, nrow, sizeof *index, cost_cmp, cost) ;
	signal_gen(temp_mat, nrow, ncol, index, cost) ;
	qsort(keys, nkeys, sizeof (char *), key_nsensors_cmp); 
	#ifdef DEBUG
	for (i = 0; i < nrow; i++){
		
		for(j = 0; j < ncol; j ++){
			fprintf(stderr, "%d ", mat   [ i ][j] ) ;
		}
		fprintf(stderr, "   cost is %d, sorted cost is %d\n", cost[i], index[i]) ;
	}
	fprintf(stderr, "cost of 2 : %d\n",  cost_fun(NULL, mat, nrow, ncol, 2)) ;

	for(i = 0; i < nkeys ; i++){
		ENTRY e={ keys[i], NULL};
		et = hsearch(e, FIND) ;
		SIG_KNOB sk =  et->data;

		if(et == NULL){
			fprintf(stderr, "nothing found \n") ;
		}else{
			fprintf(stderr, "key: %s, knob: %d,%d,%d; dominating: ", sk->signal_key, 
				( (SIG_KNOB )(et->data))->knobs[0],
				( (SIG_KNOB )(et->data))->knobs[1],
				( (SIG_KNOB )(et->data))->knobs[2] ) ;
			for(j = 0; j < sk->ndominating_sig ; j ++){
				fprintf(stderr, "%s, ", sk->dominating_signal[j]->signal_key ) ;
			}
			fprintf(stderr, "\n") ;
		}
	}
	#endif
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
