=begin
%%{

  machine Verilog;

  # keywords
  module_keyword = 'and' | 'nand' | 'or' | 'nor' | 'xor' | 'xnor' | 'dff' ;
  module = 'module' ;
  endmodule = 'endmodule' ;
  n_output_gatetype = 'buf' | 'not' ;

  integer     = ('+'|'-')?[0-9]+;
  decimals    = [0-9][0-9_]* ;
  assignment  = '=';
  identifier  = [a-zA-Z_][a-zA-Z0-9$_]* ;

  
  main := |*
    
    module_keyword => {
      emit(:module_keyword, data, token_array, ts, te)
    };
    
    identifier => { 
      emit(:identifier, data, token_array, ts, te) 
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
