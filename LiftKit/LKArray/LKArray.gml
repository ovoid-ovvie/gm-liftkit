/// @desc Returns true if the array has no elements, or false if it contains at least one element.
/// @param {Array} array The array to check.
/// @returns {Bool}
/// @pure
function array_empty(array)
{
	return ( array_length(array) == 0 );
}

/// @description Splits an array into a series of smaller arrays (chunks) of a specified length.
/// @param {Array} arr The source array to be split.
/// @param {Real} size The maximum number of elements per chunk.
/// @return {Array<Array>} A new array containing the generated chunks.
function array_chunk(arr, size)
{
    var store = [];
    var len = array_length(arr);
    for (var i = 0; i < len; i += size)
    {
        var chunk = [];
        array_copy(chunk, 0, arr, i, min(size, len - i));
        array_push(store, chunk);
    }
    return store;
}

/// @desc Flattens a nested array into a single-dimensional array. Recursively flattens any sub-arrays found at any depth.
/// @param {Array} array The array to flatten.
/// @returns {Array}
/// @pure
function array_flatten(array)
{
	var store = [];
	for (var i = 0; i < array_length(array); i++)
	{
		if ( is_array(array[i]) )
		{
			var subarray = array_flatten(array[i]);
			for (var j = 0; j < array_length(subarray); j++)
			{
				array_push(store, subarray[j]);
			}
		}
		else
		{
			array_push(store, array[i]);
		}
	}
	return store;
}

/// @desc Returns a random element from the array or its subsection. If the array/subsection is empty, undefined is returned.
/// @param {Array} array The array to get the random element from.
/// @param {Real} [offset] The starting index of the subsection (for a negative offset, it will count from array end).
/// @param {Real} [length] The length of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Any|Undefined}
function array_get_random(array, offset = 0, length = undefined)
{
	var _array_length = array_length(array);
	length ??= _array_length;
	
	if ( offset < 0 )
	{
		offset = max(_array_length + offset, 0);
	}
	
	if ( length < 0 )
	{
		length = min(offset + 1, -length);
		offset -= length - 1;
	}
	
	length = min(_array_length - offset, length);
	if ( length <= 0 )
	{
		return undefined;
	}
	
	var index = irandom_range(offset, offset + length - 1);
	return ( array[index] );
}

/// @desc Pops a random element from the array or its subsection. If the array/subsection is empty, undefined is returned.
/// @param {Array} array The array to pop the random element from.
/// @param {Real} [offset] The starting index of subsection (for a negative offset, it will count from array end).
/// @param {Real} [length] The lengthg of the subsection (for a negative length, it will count backwards from the offset position).
/// @returns {Any|Undefined}
function array_pop_random(array, offset = 0, length = undefined)
{
	var _array_length = array_length(array);
	length ??= _array_length;
	
	if ( offset < 0 )
	{
		offset = max(_array_length + offset, 0);
	}
	
	if ( length < 0 )
	{
		length = min(offset + 1, length);
	}
	
	length = min(_array_length - offset, length);
	if ( length <= 0 )
	{
		return undefined;
	}
	
	var index = irandom_range(offset, offset + length - 1);
	var element = array[index];
	array_delete(array, index, 1);
	return element;
}

/// @desc Returns a copy of the given array with the oldest elements removed if it exceeds a given maximum size.
/// @param {Array} array
/// @param {Real} limit The limit to impose
/// @returns {Array}
/// @pure
function array_cull(array, limit)
{
    // - exit early if loop is not required -
    if ( array_length(array) <= limit ) return array;
    
    // - main logic -
    var store = variable_clone(array);
    var count = array_length(array);
    while ( count > limit )
    {
        array_delete(store, 0, 1);
        count--;
    }
    return store;
}

/// @desc Pushes items from one array at the end of another array.
/// @param {Array} dest The destination array to push the items to.
/// @param {Array} source The source array with the items to push.
/// @param {Real} [offset] The offset of the source array to start taking items from.
/// @param {Real} [length] The length of the source array subsection to push.
function array_push_ext(dest, source, offset = 0, length = undefined)
{
	var source_length = array_length(source);
	length ??= source_length;
	var from = ( offset >= 0 ) ? offset : source_length + offset;
	var to = clamp(from + length, -1, source_length);
	if ( (from < 0 && to <= 0) || (from >= source_length && to >= source_length - 1) )
	{
		return;
	}
	
	from = clamp(from, 0, source_length - 1);
	
	array_copy(dest, array_length(dest), source, from, to - from);
}

/// @desc Inserts items from one array into another array.
/// @param {Array} dest The destination array to insert the items into.
/// @param {Real} index The index in the destination array where the items should be inserted.
/// @param {Array} source The source array with the items to insert.
/// @param {Real} [offset] The offset of the source array to start taking items from.
/// @param {Real} [length] The length of the source array subsection to insert.
function array_insert_ext(dest, index, source, offset = 0, length = undefined)
{
	var source_length = array_length(source);
	length ??= source_length;
	var from = ( offset >= 0 ) ? offset : source_length + offset;
	var to = clamp(from + length, -1, source_length)
	if ( (from < 0 && to <= 0) || (from >= source_length && to >= source_length - 1) )
	{
		return;
	}
	
	from = clamp(from, 0, source_length - 1);
	var count = abs(to - from);
	
	if ( dest == source )
	{
		source = array_create(count);
		array_copy(source, 0, dest, from, to - from);
		from = 0;
		to = count;
	}
	
	var dest_length = array_length(dest);
	if ( index < 0 )
	{
		index = max(dest_length + index, 0);
	}
	
	array_resize(dest, dest_length + count);
	for (var i = dest_length - 1; i >= index; i--)
	{
		dest[i + count] = dest[i];
	}
	
	array_copy(dest, index, source, from, to - from);
}

/// @desc Adds any number of values to the end of the given array, removing the oldest elements if it exceeds a given maximum size. Add any amount of values after the limit argument.
/// @param {Array} array
/// @param {Real} limit The limit to impose
/// @param {Any|Array<Any>} ... One or more values or arrays of values.
/// @returns {Array}
function array_push_limit(array, limit)
{
    for (var i = 2; i < argument_count; i++) 
    {
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				array_push(array, argument[i][j]);
			}
		}
		else
		{
			array_push(array, argument[i]);
		}
    }

    var count = array_length(array);
    while ( count > limit )
    {
        array_delete(array, 0, 1);
        count--;
    }
}

/// @desc Returns the highest value in an array or subsection of one. Returns 0 if the array or subsection is empty.
/// @param {Array<Real>} array The array to search.
/// @param {Real} [offset] The index to start from. Negative values count from the end of the array.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset position.
/// @returns {Real}
function array_max(array, offset = 0, length = undefined)
{
	var arr_length = array_length(array);
	length ??= arr_length;
	
	if ( offset < 0 )
	{
		offset = max(arr_length + offset, 0);
	}
	
	if ( length < 0 )
	{
		length = min(offset + 1, -length);
		offset -= length - 1;
	}
	
	length = min(arr_length - offset, length);
	if ( length <= 0 ) return 0;
	
	if ( length <= 10000 )
	{
		return script_execute_ext(max, array, offset, length);
	}
	
	var result = -infinity;
	for (var i = 0; i < length; i += 10000)
	{
		var partial = script_execute_ext(max, array, offset + i, min(10000, length - i));
		result = max(result, partial);
	}
	return result;
}

/// @desc Returns the lowest value in an array or subsection of one. Returns 0 if the array or subsection is empty.
/// @param {Array<Real>} array The array to search.
/// @param {Real} [offset] The index to start from. Negative values count from the end of the array.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset position.
/// @returns {Real}
function array_min(array, offset = 0, length = undefined)
{
	var arr_length = array_length(array);
	length ??= arr_length;
	
	if ( offset < 0 )
	{
		offset = max(arr_length + offset, 0);
	}
	
	if ( length < 0 )
	{
		length = min(offset + 1, -length);
		offset -= length - 1;
	}
	
	length = min(arr_length - offset, length);
	if ( length <= 0 ) return 0;
	
	if ( length <= 10000 )
	{
		return script_execute_ext(min, array, offset, length);
	}
	
	var result = infinity;
	for (var i = 0; i < length; i += 10000)
	{
		var partial = script_execute_ext(min, array, offset + i, min(10000, length - i));
		result = min(result, partial);
	}
	return result;
}

/// @desc Updates all numbers in an array to match the highest value. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_max(arr)
{
    // - initialise and find target -
    var nums = variable_clone(arr);
    var target_val = array_max(nums);
    
    // - set all values to target -
    for (var i = 0; i < array_length(nums); i++)
    {
        nums[i] = target_val;
    }
    return nums;
}

/// @desc Raises the lowest numbers in an array towards the highest number, using a limited `budget` of increments and distributing increments evenly. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @param {Real} budget How many total increments to allow.
/// @param {Bool} [overflow] If true, values can exceed the original maximum.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_max_budget(arr, budget, overflow = false)
{
	var nums = variable_clone(arr);
	var min_val;
	var target_max = array_max(nums);
	
	while ( budget > 0 )
	{
        // - update min -
		min_val = array_min(nums);
		
        // - overflow check -
		if ( !overflow && min_val >= target_max ) then break;
		
        // - apply increment -
		for (var i = 0; i < array_length(nums); i++)
		{
			if ( nums[i] == min_val && budget > 0 )
			{
				nums[i]++;
				budget--;
			}
		}
	}
	
	return nums;
}

/// @desc Updates all numbers in an array to match the lowest value. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_min(arr)
{
    // - initialise and find target -
    var nums = variable_clone(arr);
    var target_val = array_min(nums);
    
    // - set all values to target -
    for (var i = 0; i < array_length(nums); i++)
    {
        nums[i] = target_val;
    }
    return nums;
}

/// @desc Decreases the highest numbers in an array towarsd the lowest number, using a limited `budget` of decrements and distributing decrements evenly. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @param {Real} budget How many total decrements to allow.
/// @param {Bool} [underflow] If true, values can be incremented below the original maximum.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_min_budget(arr, budget, underflow = false)
{
	var nums = variable_clone(arr);
	var max_val;
	var target_min = array_min(nums);
	
	while ( budget > 0 )
	{
        // - update max -
		max_val = array_max(nums);
		
        // - underflow check -
		if ( !underflow && max_val <= target_min ) then break;
		
        // - apply decrement -
		for (var i = 0; i < array_length(nums); i++)
		{
			if ( nums[i] == max_val && budget > 0 )
			{
				nums[i]--;
				budget--;
			}
		}
	}
	
	return nums;
}

/// @desc Combines any number of arrays into a single array of sub-arrays, where each sub-array contains the elements at the same index from each input array. If arrays are of unequal length, missing values are filled with the fill argument. Use undefined as the fill value if no specific fill value is needed.
/// @param {Any} fill The value to fill missing elements with. Use undefined if no specific fill value is needed.
/// @param {Array} ... Two or more arrays to zip together.
/// @returns {Array|Undefined}
/// @pure
function array_zip(fill)
{
	var max_len = 0;
	for (var i = 1; i < argument_count; i++)
	{
		if ( !is_array(argument[i]) ) return undefined;
		max_len = max(max_len, array_length(argument[i]));
	}
	
	var store = [];
	for (var i = 0; i < max_len; i++)
	{
		var pair = [];
		for (var j = 1; j < argument_count; j++)
		{
			if ( i < array_length(argument[j]) )
			{
				array_push(pair, argument[j][i]);
			}
			else
			{
				array_push(pair, fill);
			}
		}
		array_push(store, pair);
	}
	return store;
}

/// @desc Splits an array of sub-arrays into an array of arrays, one per column. The inverse of array_zip.
/// @param {Array} array The zipped array to unzip. Each sub-array must be the same length.
/// @returns {Array}
/// @pure
function array_unzip(array)
{
    var store = [];
    var cols = array_length(array[0]);
    for (var i = 0; i < cols; i++)
    {
        array_push(store, []);
    }
    for (var i = 0; i < array_length(array); i++)
    {
        for (var j = 0; j < cols; j++)
        {
            array_push(store[j], array[i][j]);
        }
    }
    return store;
}