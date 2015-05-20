=begin
%%{

  machine simple_lexer;
  
  integer     = ('+'|'-')?[0-9]+;
  float       = ('+'|'-')?[0-9]+'.'[0-9]+;
  assignment  = '=';

  n_input_gatetype = 'and' | 'nand' | 'or' | 'nor' | 'xor' | 'xnor' ;
  n_output_gatetype = 'buf' | 'not' ;

#  identifier  = [a-zA-Z_]+; 

  
  main := |*
    
    integer => { 
      emit(:integer_literal, data, token_array, ts, te) 
    };
    
    float => { 
      emit(:float_literal, data, token_array, ts, te) 
    };
    
    assignment => { 
      emit(:assignment_operator, data, token_array, ts, te) 
    };
    
#    identifier => { 
#      emit(:identifier, data, token_array, ts, te) 
#    };

    n_input_gatetype => {
      emit(:n_input_gatetype, data, token_array, ts, te)
    };
    
    space;
    
  *|;

}%%
=end
 
%% write data;
# %% this just fixes our syntax highlighting...
 
def emit(token_name, data, target_array, ts, te)
  target_array << {:name => token_name.to_sym, :value => data[ts...te].pack("c*") }
end

def run(data = nil)
	if (data == nil) 
		data = STDIN.read.unpack("c*") 
	else
		data = data.unpack("c*") if(data.is_a?(String))
	end
	eof = data.length
	token_array = []

	%% write init;
	%% write exec;

	puts token_array.inspect
end
