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
/// @param {Any|Array} ...values One or more values or arrays of values.
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

/// @desc Checks if a surface exists and is the right size; if not, recreates it with the correct dimensions.
/// @param {Id.Surface} surface The surface to check.
/// @param {Real} width The target width.
/// @param {Real} height The target height.
function surface_verify(surface, width, height)
{
	if ( surface_exists(surface) )
	{
		if ( surface_get_width(surface) == width || surface_get_height(surface) == height )
		{
			return surface;
		}
		surface_free(surface);
	}
	return surface_create(width, height);
}

/// @desc Creates a debug message with callstack. Accepts any number of values as arguments, automatically processing them and converting them to strings.
/// @param {Any} ...messages One or more values to be converted into strings and used in the message.
function debug_trace()
{
	var _string = "";
	var _stack = debug_get_callstack();
	for (var i = 0; i < argument_count; i++)
	{
		_string += string(argument[i]);
	}
	_string += "\nCallstack:\n";
	var _iter = array_length(_stack);
	for (var i = 1; i < _iter; i++)
	{
		_string += $"  {_stack[i]}\n";
	}
	show_debug_message(_string);
}

/// @desc Shows a debug message if the build is an executable, throwing an error if it is within the IDE. Includes callstack.
/// @param {Any} ... One or more values to be converted into strings and used in the message.
function debug_assert()
{
	var _string = "";
	var _stack = debug_get_callstack();
	for (var i = 0; i < argument_count; i++)
	{
		_string += string(argument[i]);
	}
	_string += "\nCallstack:\n";
	var _iter = array_length(_stack);
	for (var i = 1; i < _iter; i++)
	{
		_string += $"  {_stack[i]}\n";
	}
	if ( GM_build_type == "run" )
	{
		show_error(_string, true);
	}
	else
	{
		show_debug_message(_string);
	}
}

/// @desc Takes an exception as input and creates a single string combining all of its parts with newlines in between.
/// @param {Struct} exception The exception message to combine.
/// @pure
function exception_concat(exception)
{
	return ( $"{exception.message}\n{exception.longMessage}\n{exception.script}\n{exception.stacktrace}");
}