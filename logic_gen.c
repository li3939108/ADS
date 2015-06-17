#include <stdio.h>
#include <stdlib.h>

#define __ILLEGAL_FILE__ 1
#define __ILLEGAL_CHAR__ 2
#define __UNMATCHED_COL__ 3


#define DEBUG 

char * get_matrix(FILE *input){
	#ifdef DEBUG
	int i,j ;
	#endif
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
			fprintf(stderr, "unmatched column number at row %d\n", row_counter) ;
			perror("unmatched column number");
			exit(__UNMATCHED_COL__);
		}
		if (c == EOF) {nrow = row_counter ;}
		break;
		
		default:
		perror("illegal character");
		exit(__ILLEGAL_CHAR__);
		break;
		}
	} while(c != EOF) ;
	#ifdef DEBUG
	for (i = 0; i < nrow; i++){
		for(j = 0; j < ncol; j ++){
			fprintf(stderr, "%d ", ret[ i * ncol + j] ) ;
		}
		fprintf(stderr, "\n") ;
	}
	#endif	
	return ret ;
	}
}
int main(){
	FILE *fp = fopen("input", "r") ;
	get_matrix(fp) ;
	fclose(fp) ;
}
