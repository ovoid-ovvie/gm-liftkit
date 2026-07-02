/// @desc Returns an array of all variable names within a struct in alphabetical order.
/// @param {Struct} struct The struct to get the names of.
/// @param {Bool} [ascending] Whether to sort in ascending order (true) or descending order (false).
/// @returns {Array<String>}
/// @pure
function variable_struct_get_names_alphabetical(struct, ascending = LK_VARIABLE_STRUCT_GET_NAMES_ALPHABETICAL_ASCENDING_DEFAULT)
{
	var _names = variable_struct_get_names(struct);
	array_sort(_names, ascending);
	return _names;
}

/// @desc Returns an array of all values within a struct.
/// @param {Struct} struct The struct to get the values of.
/// @returns {Array}
/// @pure
function variable_struct_get_values(struct)
{
	var _names = variable_struct_get_names(struct);
	var _length = array_length(_names);
	var _array = array_create(_length);
	for (var i = 0; i < _length; i++)
	{
		_array[i] = struct[$ _names[i]];
	}
	return _array;
}

/// @desc Merges any number of structs into a single new struct. In the case of duplicate keys, the value from the earliest struct is used. Returns undefined if no arguments are supplied or if a non-struct argument is encountered.
/// @param {Struct} ...structs One or more structs to merge.
/// @returns {Struct|Undefined}
/// @pure
function struct_merge()
{
	if ( argument_count == 0 ) return undefined;
	var store = {};
	var names;
	for (var i = 0; i < argument_count; i++)
	{
		if ( !is_struct(argument[i]) ) return undefined;
		names = variable_struct_get_names(argument[i]);
		var iter = array_length(names);
		for (var j = 0; j < iter; j++)
		{
			if ( !variable_struct_exists(store, names[j]) )
			{
				store[$ names[j]] = argument[i][$ names[j]];
			}
		}
	}
	return store;
}

/// @desc Merges any number of structs into a single new struct, recursively merging any nested structs. In the case of duplicate keys, the value from the earliest struct is used. Returns undefined if no arguments are supplied or if a non-struct argument is encountered.
/// @param {Struct} ...structs One or more structs to merge.
/// @returns {Struct|Undefined}
/// @pure
function struct_merge_deep()
{
	if ( argument_count == 0 ) return undefined;
	var _store = {};
	for (var i = 0; i < argument_count; i++)
	{
		if ( !is_struct(argument[i]) ) return undefined;
		var _names = variable_struct_get_names(argument[i]);
		var _iter = array_length(_names);
		for (var j = 0; j < _iter; j++)
		{
			var _key = _names[j];
			var _val = argument[i][$ _key];
			if ( variable_struct_exists(_store, _key) && is_struct(_store[$ _key]) && is_struct(_val) )
			{
				_store[$ _key] = struct_merge_deep(_store[$ _key], _val);
			}
			else if ( !variable_struct_exists(_store, _key) )
			{
				_store[$ _key] = _val;
			}
		}
	}
	return _store;
}

/// @desc Searches variables within a struct until it finds one that equals a given value, returning true. Returns false if none is found.
/// @param {Struct} struct The struct to search through.
/// @param {Any} value The value to look for.
/// @returns {Bool}
/// @pure
function struct_contains_value(struct, value)
{
	var _names = variable_struct_get_names(struct);
	var _iter = array_length(_names);
	for (var i = 0; i < _iter; i++)
	{
		if ( struct[$ _names[i]] == value )
		{
			return true;
		}
	}
	return false;
}

/// @desc Searches variables within a struct until it finds one that equals a given value, returning the variable name as a string. Returns an empty string if none is found.
/// @param {Struct} struct The struct to search through.
/// @param {Any} value The value to look for.
/// @returns {String}
/// @pure
function struct_find(struct, value)
{
	var _names = variable_struct_get_names(struct);
	var _iter = array_length(_names);
	for (var i = 0; i < _iter; i++)
	{
		if ( struct[$ _names[i]] == value )
		{
			return _names[i];
		}
	}
	return "";
}

/// @desc Returns a new struct containing only the key-value pairs for which the predicate returns true.
/// @param {Struct} struct The struct to filter.
/// @param {Function} predicate A function that takes (key, value) and returns true or false.
/// @returns {Struct}
/// @pure
function struct_filter(struct, predicate)
{
	var _store = {};
	var _names = variable_struct_get_names(struct);
	var _iter = array_length(_names);
	for (var i = 0; i < _iter; i++)
	{
		var _key = _names[i];
		var _val = struct[$ _key];
		if ( predicate(_key, _val) )
		{
			_store[$ _key] = _val;
		}
	}
	return _store;
}

/// @desc Returns a new struct with each value replaced by the result of passing it through a transform function.
/// @param {Struct} struct The struct to map over.
/// @param {Function} transform A function that takes (key, value) and returns the new value.
/// @returns {Struct}
/// @pure
function struct_map(struct, transform)
{
	var _store = {};
	var _names = variable_struct_get_names(struct);
	var _iter = array_length(_names);
	for (var i = 0; i < _iter; i++)
	{
		var _key = _names[i];
		_store[$ _key] = transform(_key, struct[$ _key]);
	}
	return _store;
}