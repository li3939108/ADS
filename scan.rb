
# line 1 "scan.rl"
=begin

# line 43 "scan.rl"

=end
 

# line 11 "scan.rb"
class << self
	attr_accessor :_Verilog_actions
	private :_Verilog_actions, :_Verilog_actions=
end
self._Verilog_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	5, 1, 6, 1, 7, 1, 8, 1, 
	9, 1, 10, 1, 11, 2, 2, 3, 
	2, 2, 4
]

class << self
	attr_accessor :_Verilog_key_offsets
	private :_Verilog_key_offsets, :_Verilog_key_offsets=
end
self._Verilog_key_offsets = [
	0, 0, 2, 4, 21, 24, 26, 34, 
	43, 52, 62, 71, 81
]

class << self
	attr_accessor :_Verilog_trans_keys
	private :_Verilog_trans_keys, :_Verilog_trans_keys=
end
self._Verilog_trans_keys = [
	48, 57, 48, 57, 32, 43, 45, 61, 
	95, 97, 110, 111, 120, 9, 13, 48, 
	57, 65, 90, 98, 122, 46, 48, 57, 
	48, 57, 36, 95, 48, 57, 65, 90, 
	97, 122, 36, 95, 110, 48, 57, 65, 
	90, 97, 122, 36, 95, 100, 48, 57, 
	65, 90, 97, 122, 36, 95, 97, 111, 
	48, 57, 65, 90, 98, 122, 36, 95, 
	114, 48, 57, 65, 90, 97, 122, 36, 
	95, 110, 111, 48, 57, 65, 90, 97, 
	122, 36, 95, 111, 48, 57, 65, 90, 
	97, 122, 0
]

class << self
	attr_accessor :_Verilog_single_lengths
	private :_Verilog_single_lengths, :_Verilog_single_lengths=
end
self._Verilog_single_lengths = [
	0, 0, 0, 9, 1, 0, 2, 3, 
	3, 4, 3, 4, 3
]

class << self
	attr_accessor :_Verilog_range_lengths
	private :_Verilog_range_lengths, :_Verilog_range_lengths=
end
self._Verilog_range_lengths = [
	0, 1, 1, 4, 1, 1, 3, 3, 
	3, 3, 3, 3, 3
]

class << self
	attr_accessor :_Verilog_index_offsets
	private :_Verilog_index_offsets, :_Verilog_index_offsets=
end
self._Verilog_index_offsets = [
	0, 0, 2, 4, 18, 21, 23, 29, 
	36, 43, 51, 58, 66
]

class << self
	attr_accessor :_Verilog_indicies
	private :_Verilog_indicies, :_Verilog_indicies=
end
self._Verilog_indicies = [
	0, 1, 3, 2, 4, 5, 5, 6, 
	7, 8, 9, 10, 11, 4, 0, 7, 
	7, 1, 13, 0, 12, 3, 14, 7, 
	7, 7, 7, 7, 15, 7, 7, 17, 
	7, 7, 7, 16, 7, 7, 18, 7, 
	7, 7, 16, 7, 7, 8, 10, 7, 
	7, 7, 16, 7, 7, 18, 7, 7, 
	7, 16, 7, 7, 19, 10, 7, 7, 
	7, 16, 7, 7, 10, 7, 7, 7, 
	16, 0
]

class << self
	attr_accessor :_Verilog_trans_targs
	private :_Verilog_trans_targs, :_Verilog_trans_targs=
end
self._Verilog_trans_targs = [
	4, 0, 3, 5, 3, 1, 3, 6, 
	7, 9, 10, 11, 3, 2, 3, 3, 
	3, 8, 6, 12
]

class << self
	attr_accessor :_Verilog_trans_actions
	private :_Verilog_trans_actions, :_Verilog_trans_actions=
end
self._Verilog_trans_actions = [
	5, 0, 17, 0, 9, 0, 7, 24, 
	0, 0, 0, 0, 11, 0, 13, 19, 
	15, 0, 21, 0
]

class << self
	attr_accessor :_Verilog_to_state_actions
	private :_Verilog_to_state_actions, :_Verilog_to_state_actions=
end
self._Verilog_to_state_actions = [
	0, 0, 0, 1, 0, 0, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :_Verilog_from_state_actions
	private :_Verilog_from_state_actions, :_Verilog_from_state_actions=
end
self._Verilog_from_state_actions = [
	0, 0, 0, 3, 0, 0, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :_Verilog_eof_trans
	private :_Verilog_eof_trans, :_Verilog_eof_trans=
end
self._Verilog_eof_trans = [
	0, 0, 3, 0, 13, 15, 16, 17, 
	17, 17, 17, 17, 17
]

class << self
	attr_accessor :Verilog_start
end
self.Verilog_start = 3;
class << self
	attr_accessor :Verilog_first_final
end
self.Verilog_first_final = 3;
class << self
	attr_accessor :Verilog_error
end
self.Verilog_error = 0;

class << self
	attr_accessor :Verilog_en_main
end
self.Verilog_en_main = 3;


# line 47 "scan.rl"
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

	
# line 178 "scan.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = Verilog_start
	ts = nil
	te = nil
	act = 0
end

# line 63 "scan.rl"
	
# line 190 "scan.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _Verilog_from_state_actions[cs]
	_nacts = _Verilog_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _Verilog_actions[_acts - 1]
			when 1 then
# line 1 "NONE"
		begin
ts = p
		end
# line 224 "scan.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _Verilog_key_offsets[cs]
	_trans = _Verilog_index_offsets[cs]
	_klen = _Verilog_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _Verilog_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _Verilog_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _Verilog_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _Verilog_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _Verilog_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _Verilog_indicies[_trans]
	end
	if _goto_level <= _eof_trans
	cs = _Verilog_trans_targs[_trans]
	if _Verilog_trans_actions[_trans] != 0
		_acts = _Verilog_trans_actions[_trans]
		_nacts = _Verilog_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _Verilog_actions[_acts - 1]
when 2 then
# line 1 "NONE"
		begin
te = p+1
		end
when 3 then
# line 18 "scan.rl"
		begin
act = 1;		end
when 4 then
# line 34 "scan.rl"
		begin
act = 5;		end
when 5 then
# line 30 "scan.rl"
		begin
te = p+1
 begin  
      emit(:assignment_operator, data, token_array, ts, te) 
     end
		end
when 6 then
# line 39 "scan.rl"
		begin
te = p+1
		end
when 7 then
# line 22 "scan.rl"
		begin
te = p
p = p - 1; begin  
      emit(:integer_literal, data, token_array, ts, te) 
     end
		end
when 8 then
# line 26 "scan.rl"
		begin
te = p
p = p - 1; begin  
      emit(:float_literal, data, token_array, ts, te) 
     end
		end
when 9 then
# line 34 "scan.rl"
		begin
te = p
p = p - 1; begin  
      emit(:identifier, data, token_array, ts, te) 
     end
		end
when 10 then
# line 22 "scan.rl"
		begin
 begin p = ((te))-1; end
 begin  
      emit(:integer_literal, data, token_array, ts, te) 
     end
		end
when 11 then
# line 1 "NONE"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end

      emit(:n_input_gatetype, data, token_array, ts, te)
    end
	when 5 then
	begin begin p = ((te))-1; end
 
      emit(:identifier, data, token_array, ts, te) 
    end
end 
			end
# line 365 "scan.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _Verilog_to_state_actions[cs]
	_nacts = _Verilog_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _Verilog_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 385 "scan.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _Verilog_eof_trans[cs] > 0
		_trans = _Verilog_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 64 "scan.rl"

	puts token_array.inspect
end
