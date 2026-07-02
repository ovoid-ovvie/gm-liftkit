/// @desc Returns the boolean b as a string according to its value.
/// @param {Bool} b
/// @param {Bool} [true_label] String to return if b is true.
/// @param {Bool} [false_label] String to return if b is false.
/// @returns {String}
/// @pure
function bool_stringify 
(
    b,
    true_label = LK_BOOL_STRINGIFY_DEFAULT_IF_TRUE,
    false_label = LK_BOOL_STRINGIFY_DEFAULT_IF_FALSE
)
{
    var str = "?";
	if ( typeof(b) == "bool" )
	{
		str = ( b ) ? true_label : false_label;
	}
	else if ( typeof(b) == "number" )
	{
		str = ( b == 0 ) ? false_label : true_label;
	}
	return str;
}

/// @desc Checks if a string contains a specified substring (true) or not (false).
/// @param {String} substr
/// @param {String} str
/// @param {Bool} [case_sensitive] Whether to search for case sensitive matches only (true) or not (false).
/// @returns {Bool}
/// @pure
function string_contains(substr, str, case_sensitive = LK_STRING_CONTAINS_CASE_SENSITIVE_DEFAULT)
{
	if ( !case_sensitive )
	{
		return ( string_pos(substr, str) != 0 );
	}
	else
	{
		var _substr = string_lower(substr);
		var _str = string_lower(str);
		return ( string_pos(_substr, _str) != 0 );
	}
}

/// @desc Returns the number of occurrences of substr within str, case insensitively.
/// @param {String} substr The substring to count.
/// @param {String} str The string to search within.
/// @returns {Real}
/// @pure
function string_count_nocase(substr, str)
{
	var _substr = string_lower(substr);
	var _str = string_lower(str);
	return ( string_count(_substr, _str) );
}

/// @desc Returns true if str1 and str2 are equal, case insensitively.
/// @param {String} str1 The first string to compare.
/// @param {String} str2 The second string to compare.
/// @returns {Bool}
/// @pure
function string_equals_nocase(str1, str2)
{
	return ( string_lower(str1) == string_lower(str2) );
}

/// @desc Pads str on the left with char until it reaches the target length. Returns str unchanged if it is already at or above the target length.
/// @param {String} str The string to pad.
/// @param {Real} _len The target length to pad to.
/// @param {String} char The character to pad with.
/// @returns {String}
/// @pure
function string_pad_left(str, _len, char)
{
	var len = string_length(str);
	if ( len >= _len ) return str;
	return ( string_repeat(char, _len - len) + str );
}

/// @desc Pads str on the right with char until it reaches the target length. Returns str unchanged if it is already at or above the target length.
/// @param {String} str The string to pad.
/// @param {Real} _len The target length to pad to.
/// @param {String} char The character to pad with.
/// @returns {String}
/// @pure
function string_pad_right(str, _len, char)
{
	var len = string_length(str);
	if ( len >= _len ) return str;
	return ( str + string_repeat(char, _len - len) );
}

/// @desc Pads str on the right and left with char until it reaches the target length. Returns str unchanged if it is already at or above the target length.
/// @param {String} str The string to pad.
/// @param {Real} _len The target length to pad to.
/// @param {String} char The character to pad with.
/// @param {Bool} [bias_left] When padding is uneven, give the extra character to the left side (true) or right side (false).
/// @param {String} [separator] A character to place between the string and the padding.
/// @param {Bool} [force_separator] Whether to include the separator even if there is no room for padding (true), or strip the separator and pad without it if there is still room (false).
/// @pure
function string_pad_full
(
	str, _len, char,
	bias_left = LK_STRING_PAD_FULL_BIAS_LEFT_DEFAULT,
	separator = undefined,
	force_separator = LK_STRING_PAD_FULL_FORCE_SEPARATOR_DEFAULT
)
{
	// - variables -
	separator ??= "";
	var len = string_length(str);
	if ( len >= _len ) return str; // early return
	var sep_len = string_length(separator);
	var pad = (_len - len) - (sep_len * 2);
	
	// - guardrails -
	if ( pad <= 0 )
	{
		if ( force_separator ) 
		{
			return ( separator + str + separator );
		}
		separator = "";
		pad = _len - len;
	}
	
	// - logic -
	var func1 = bias_left ? ceil : floor;
	var func2 = bias_left ? floor : ceil;
	var rep1 = string_repeat(char, func1(pad / 2));
	var rep2 = string_repeat(char, func2(pad / 2));
	return ( rep1 + separator + str + separator + rep2 );
}

/// @desc Returns the position of the first occurrence of substr within str, case insensitively. Returns 0 if substr is not found.
/// @param {String} substr The substring to search for.
/// @param {String} str The string to search within.
/// @returns {Real}
/// @pure
function string_pos_nocase(substr, str)
{
	var _substr = string_lower(substr);
	var _str = string_lower(str);
	return ( string_pos(_substr, _str) );
}

/// @desc Returns the position of the first occurrence of substr within str at or after start_pos, case insensitively. Returns 0 if substr is not found.
/// @param {String} substr The substring to search for.
/// @param {String} str The string to search within.
/// @param {Real} start_pos The position to start searching from.
/// @returns {Real}
/// @pure
function string_pos_ext_nocase(substr, str, start_pos)
{
	var _substr = string_lower(substr);
	var _str = string_lower(str);
	return ( string_pos_ext(_substr, _str, start_pos) );
}

/// @desc Returns the position of the last occurrence of substr within str, case insensitively. Returns 0 if substr is not found.
/// @param {String} substr The substring to search for.
/// @param {String} str The string to search within.
/// @returns {Real}
/// @pure
function string_last_pos_nocase(substr, str)
{
	var _substr = string_lower(substr);
	var _str = string_lower(str);
	return ( string_last_pos(_substr, _str) );
}

/// @desc Returns the position of the last occurrence of substr within str at or before start_pos, case insensitively. Returns 0 if substr is not found.
/// @param {String} substr The substring to search for.
/// @param {String} str The string to search within.
/// @param {Real} start_pos The position to start searching backwards from.
/// @returns {Real}
/// @pure
function string_last_pos_ext_nocase(substr, str, start_pos)
{
	var _substr = string_lower(substr);
	var _str = string_lower(str);
	return ( string_last_pos_ext(_substr, _str, start_pos) );
}

/// @desc Returns an array of positions of every occurrence of substr within str, starting from start_pos. Returns an empty array if substr is not found.
/// @param {String} substr The substring to search for.
/// @param {String} str The string to search within.
/// @param {Real} [start_pos] The position to start searching from. Defaults to 1.
/// @returns {Array<Real>}
/// @pure
function string_pos_all(substr, str, start_pos = 1)
{
	var str_len = string_length(str);
	var sub_len = string_length(substr);
	var store = [];
	var pos = start_pos;
	while ( pos <= str_len )
	{
		var result = string_pos_ext(substr, str, pos);
		if ( result == 0 ) break;
		array_push(store, result);
		pos = result + sub_len;
	}
	return store;
}

/// @desc Returns an array of positions of every occurrence of substr within str, starting from start_pos, case insensitively. Returns an empty array if substr is not found.
/// @param {String} substr The substring to search for.
/// @param {String} str The string to search within.
/// @param {Real} [start_pos] The position to start searching from. Defaults to 1.
/// @returns {Array<Real>}
/// @pure
function string_pos_all_nocase(substr, str, start_pos = 1)
{
	var _substr = string_lower(substr);
	var _str = string_lower(str);
	var str_len = string_length(_str);
	var sub_len = string_length(_substr);
	var store = [];
	var pos = start_pos;
	while ( pos <= str_len )
	{
		var result = string_pos_ext(_substr, _str, pos);
		if ( result == 0 ) break;
		array_push(store, result);
		pos = result + sub_len;
	}
	return store;
}

/// @desc Returns str with its characters in reverse order.
/// @param {String} str The string to reverse.
/// @returns {String}
/// @pure
function string_reverse(str)
{
	if ( str == "" ) return str;
	var len = string_length(str);
	var store = [];
	var index = len;
	while ( array_length(store) < len )
	{
		array_push(store, string_char_at(str, index));
		index--;
	}
	return ( string_concat_ext(store) );
}

/// @desc Removes all escape characters from str and returns the adjusted value. Ignores Unicode, hex literal, and octal Unicode.
/// @param {String} str The string to sanitise.
/// @param {String} [fill] The string to replace removed characters with. Pass "" to sanitise without a fill.
/// @param {Bool} [remove_slashes] Whether to remove escaped backslashes (true) or not (false).
/// @param {Bool} [remove_quotes] Whether to remove escaped quotes (true) or not (false).
/// @param {Array<String>} [exceptions] An array containing characters to ignore.
/// @return {String}
/// @pure
function string_sanitise
(
	str,
	fill = LK_STRING_SANITISE_FILL_DEFAULT,
	remove_slashes = LK_STRING_SANITISE_REMOVE_SLASHES_DEFAULT,
	remove_quotes = LK_STRING_SANITISE_REMOVE_QUOTES_DEFAULT,
	exceptions = LK_STRING_SANITISE_EXCEPTIONS_DEFAULT
)
{
	var _blacklist = ["\n", "\r", "\b", "\f", "\t", "\v", "\a"]
	var _output = str;
	if ( remove_slashes )
	{
		array_push(_blacklist, "\\");
	}
	if ( remove_quotes )
	{
		array_push(_blacklist, "\"");
	}
	for (var i = 0; i < array_length(_blacklist); i++)
	{
		var _char = _blacklist[i];
		if ( !array_contains(exceptions, _char) )
		{
			_output = string_replace_all(_output, _char, fill);
		}
	}
	return _output;
}

/// @desc Removes all escape characters from str and returns the adjusted value. Ignores Unicode, hex literal, and octal Unicode. Alias of `string_sanitise()`.
/// @param {String} str The string to sanitise.
/// @param {String} [fill] The string to replace removed characters with. Pass "" to sanitise without a fill.
/// @param {Bool} [remove_slashes] Whether to remove escaped backslashes (true) or not (false).
/// @param {Bool} [remove_quotes] Whether to remove escaped quotes (true) or not (false).
/// @param {Array<String>} [exceptions] An array containing characters to ignore.
/// @return {String}
/// @pure
function string_sanitize
(
	str,
	fill = LK_STRING_SANITISE_FILL_DEFAULT,
	remove_slashes = LK_STRING_SANITISE_REMOVE_SLASHES_DEFAULT,
	remove_quotes = LK_STRING_SANITISE_REMOVE_QUOTES_DEFAULT,
	exceptions = LK_STRING_SANITISE_EXCEPTIONS_DEFAULT
)
{
	return string_sanitise(str, fill, remove_slashes, remove_quotes, exceptions);
}

/// @desc Returns the Levenshtein distance between two strings - the minimum number of single-character insertions, deletions, or substitutions required to transform a into b. Lower values mean the strings are more similar; 0 means they are identical.
/// @param {String} a The first string to compare.
/// @param {String} b The second string to compare.
/// @returns {Real}
/// @pure
function stringdist_lev(a, b) {
    if (a == b) return 0;
    
    var la = string_length(a);
    var lb = string_length(b);
    
    if (la == 0) return lb;
    if (lb == 0) return la;

    var v0 = array_create(lb + 1);
    var v1 = array_create(lb + 1);

    for (var i = 0; i <= lb; i++) v0[i] = i;

    for (var i = 1; i <= la; i++) {
        v1[0] = i;
        for (var j = 1; j <= lb; j++) {
            var cost = (string_char_at(a, i) == string_char_at(b, j)) ? 0 : 1;
            v1[j] = min(v1[j - 1] + 1, v0[j] + 1, v0[j - 1] + cost);
        }
        array_copy(v0, 0, v1, 0, lb + 1);
    }

    return v0[lb];
}

/// @desc Returns the Damerau-Levenshtein distance (OSA) between two strings. This counts the minimum number of single-character insertions, deletions, substitutions, or transpositions of adjacent characters required to transform a into b.
/// @param {String} a The first string to compare.
/// @param {String} b The second string to compare.
/// @returns {Real}
/// @pure
function stringdist_osa(a, b) {
    if (a == b) return 0;
    
    var la = string_length(a);
    var lb = string_length(b);
    
    if (la == 0) return lb;
    if (lb == 0) return la;

    var v0 = array_create(lb + 1);
    var v1 = array_create(lb + 1);
    var v2 = array_create(lb + 1);

    for (var i = 0; i <= lb; i++) v0[i] = i;

    for (var i = 1; i <= la; i++) {
        v1[0] = i;
        for (var j = 1; j <= lb; j++) {
            var cost = (string_char_at(a, i) == string_char_at(b, j)) ? 0 : 1;
            v1[j] = min(v1[j - 1] + 1, v0[j] + 1, v0[j - 1] + cost);
            
            if (i > 1 && j > 1 && string_char_at(a, i) == string_char_at(b, j - 1) && string_char_at(a, i - 1) == string_char_at(b, j)) {
                v1[j] = min(v1[j], v2[j - 2] + 1);
            }
        }
        array_copy(v2, 0, v0, 0, lb + 1);
        array_copy(v0, 0, v1, 0, lb + 1);
    }

    return v0[lb];
}

/// @desc Searches for the most similar string across a pool of options using OSA distance.
/// @param {String} str The target string to match against.
/// @param {Real} [threshold] The maximum edit distance allowed.
/// @param {Array<String>} targets An array of strings to search through.
/// @returns {String}
/// @pure
function stringdist_find_closest(str, threshold = LK_STRINGDIST_FIND_CLOSEST_THRESHOLD_DEFAULT, targets)
{
	var _best = "";
	var _bestDist = infinity;
	for (var i = 0; i < array_length(targets); i++)
	{
		var _dist = stringdist_osa(str, targets[i]);
		if ( _dist < _bestDist )
		{
			_bestDist = _dist;
			_best = targets[i];
		}
		if ( _bestDist == 0 ) break;
	}
	if ( _bestDist <= threshold && _bestDist < string_length(str) / 2 )
	{
		return _best;
	}
	return "";
}

/// @desc Searches for the most similar string across a pool of options using OSA distance. Arguments may be individual strings or arrays of strings.
/// @param {String} str The target string to match against.
/// @param {Real} [threshold] The maximum edit distance allowed.
/// @param {String|Array<String>} ...targets One or more strings or arrays of strings to search through.
/// @returns {String}
/// @pure
function stringdist_find_closest_multi(str, threshold = LK_STRINGIDST_FIND_CLOSEST_MULTI_THRESHOLD_DEFAULT)
{
	if ( argument_count <= 2 )
	{
		return undefined;
	}
	var _array = [];
	for (var i = 2; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_string(argument[i][j]) )
				{
					array_push(_array, argument[i][j]);
				}
				else
				{
					return undefined;
				}
			}
		}
		else if ( is_string(argument[i]) )
		{
			array_push(_array, argument[i]);
		}
		else
		{
			return undefined;
		}
	}
	var _best = "";
	var _bestDist = infinity;
	for (var i = 0; i < array_length(_array); i++)
	{
		var _dist = stringdist_osa(str, _array[i]);
		if ( _dist < _bestDist )
		{
			_bestDist = _dist;
			_best = _array[i];
		}
		if ( _bestDist == 0 ) break;
	}
	if ( _bestDist <= threshold && _bestDist < string_length(str) / 2 )
	{
		return _best;
	}
	return "";
}

/// @desc Splits a string into an array of lines such that each line fits within a given pixel width, measured using string_width. Returns an array of strings, one per line.
/// @param {String} str The string to wrap.
/// @param {Real} first_line_width The maximum pixel width of the first line.
/// @param {Real} subsequent_line_width The maximum pixel width of all lines after the first.
/// @returns {Array<String>}
/// @pure
function string_reflow(str, first_line_width, subsequent_line_width)
{
	var lines = [];
	var remaining = str;
	var is_first = true;
	
	while ( string_length(remaining) > 0 )
	{
		var max_w = is_first ? first_line_width : subsequent_line_width;
		var last_fit = 0;
		var lo = 0;
		var hi = string_length(remaining);
		
		while ( lo <= hi )
		{
			var mid = floor((lo + hi) / 2);
			var test = string_copy(remaining, 1, mid);
			if ( string_width(test) <= max_w )
			{
				last_fit = mid;
				lo = mid + 1;
			}
			else
			{
				hi = mid - 1;
			}
		}
		
		if ( last_fit == 0 && string_length(remaining) > 0 )
		{
			last_fit = 1;
		}
		
		array_push(lines, string_copy(remaining, 1, last_fit));
		remaining = string_delete(remaining, 1, last_fit);
		is_first = false;
	}
	
	if ( array_length(lines) == 0 )
	{
		array_push(lines, "");
	}
	
	return lines;
}

/// @desc Returns str shortened to max_len characters, with a suffix appended if it was cut. The suffix counts toward the max length.
/// @param {String} str The string to truncate.
/// @param {Real} max_len The maximum length of the returned string.
/// @param {String} [suffix] The suffix to append if the string was cut. Defaults to "...".
/// @returns {String}
/// @pure
function string_truncate(str, max_len, suffix = LK_STRING_TRUNCATE_SUFFIX_DEFAULT)
{
	if ( string_length(str) <= max_len )
	{
		return str;
	}
	var _cut = max_len - string_length(suffix);
	if ( _cut <= 0 )
	{
		return string_copy(suffix, 1, max_len);
	}
	return string_copy(str, 1, _cut) + suffix;
}