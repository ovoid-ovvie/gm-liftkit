/// @desc Returns an array of all values in a struct.
/// @param {Struct} struct The struct to get the values of.
/// @returns {Array}
/// @pure
function variable_struct_get_values(struct)
{
	var store = [];
	var names = variable_struct_get_names(struct);
	for (var i = 0; i < array_length(names); i++)
	{
		array_push(store, struct[$ names[i]]);
	}
	return store;
}

/// @desc Merges any number of structs into a single new struct. In the case of duplicate keys, the value from the earliest struct is used. Returns undefined if no arguments are supplied or if a non-struct argument is encountered.
/// @param {Struct} ... One or more structs to merge.
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
		for (var j = 0; j < array_length(names); j++)
		{
			if ( !variable_struct_exists(store, names[j]) )
			{
				store[$ names[j]] = argument[i][$ names[j]];
			}
		}
	}
	return store;
}