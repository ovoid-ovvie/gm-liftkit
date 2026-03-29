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