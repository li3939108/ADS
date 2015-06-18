def run(data = nil)
	if (data == nil) 
		data = STDIN.read.unpack("c*") 
	else
		data = data.unpack("c*") if(data.is_a?(String))
		eof = data.length
	end
	token_array = []

	%% write init;
	%% write exec;

	puts token_array.inspect
end
