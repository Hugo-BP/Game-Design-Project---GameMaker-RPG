
function ScriptTextParser(full_str)
{
	var sub_str = "";
	var parser_char = "/";
	var t = 0;
	var arr = 0;
	
	for(var i=1 ; i < string_length(full_str)+1 ; i++)
	{
	    var next_char = string_char_at(full_str, i);
	    if (next_char != parser_char)
	    {
			sub_str += next_char;
			
			// if sub string is getting too long then add to array on next space
			if (string_length(sub_str) >= MAX_TEXT_LEN)
			{
				var next_char = string_char_at(full_str, i+1);
				if (next_char == " ")
				{
					// add to array
					arr[t] = [sub_str, -1];
					t++;
					i++;
					// reset
			        sub_str = "";
				}
			}
	    }
	    else
	    {
	        // add to array
			arr[t] = [sub_str, -1];
			t++;
			// reset
	        sub_str = "";
	    }
	}
	
	return arr;
}