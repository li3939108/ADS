

#define __MAX_NUMBER_OF_SIGNALS__ (1<<16)
#define __MAX_LEVEL__ 3

/* The max number of characters for a signal key */
#define __MAX_SIGNAL_KEY__ (1<<10)



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

	struct _sig_knob *next_level ;
} sig_knob, *SIG_KNOB ;




