/// @desc Returns true if n is not nullish (neither undefined nor pointer_null), or false if it is.
/// @param {Any} n
/// @returns {Bool}
/// @pure
function is_defined(n)
{
	return ( !is_undefined(n ?? undefined) );
}

/// @desc Returns true if n is nullish (undefined or pointer_null), or false if it is not.
/// @param {Any} n
/// @returns {Bool}
/// @pure
function is_nullish(n)
{
	return ( is_undefined(n ?? undefined) );
}

/// @desc Returns an array of all unique values from the supplied arguments, preserving order of first occurrence. Arguments may be individual values or arrays of values.
/// @param {Any|Array} ... One or more values or arrays of values.
/// @returns {Array}
/// @pure
function unique()
{
	var vals = [];
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !array_contains(vals, argument[i][j]) )
				{
					array_push(vals, argument[i][j]);
				}
			}
		}
		else 
		{
			if ( !array_contains(vals, argument[i]) )
			{
				array_push(vals, argument[i]);
			}
		}
	}
	return vals;
}

/// @desc Checks if an object's frame is currently a target number.
/// @param {Real} _frame
/// @returns {Bool}
/// @pure
function frame(_frame)
{
	return ( floor(image_index) == _frame );
}