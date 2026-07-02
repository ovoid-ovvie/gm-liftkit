/// @desc Returns true if the array has no elements, or false if it contains at least one element.
/// @param {Array} array The array to check.
/// @returns {Bool}
/// @pure
function array_empty(array)
{
	return ( array_length(array) == 0 );
}

/// @desc Splits an array into a series of smaller arrays (chunks) of a specified length.
/// @param {Array} arr The source array to be split.
/// @param {Real} size The maximum number of elements per chunk.
/// @return {Array<Array>}
function array_chunk(arr, size)
{
    var _len = array_length(arr);
	if ( _len == 0 || size <= 0 )
	{
		return [];
	}
	var _chunkCount = ceil(_len / size);
	var _store = array_create(_chunkCount);
	var _count = 0;
	for (var i = 0; i < _len; i += size)
	{
		var _chunkSize = min(size, _len - i);
		var _chunk = array_create(_chunkSize);
		array_copy(_chunk, 0, arr, i, _chunkSize);
		_store[_count] = _chunk;
		_count++;
	}
	return _store;
}

/// @desc Flattens a nested array into a single-dimensional array. Recursively flattens any sub-arrays found at any depth.
/// @param {Array} array The array to flatten.
/// @returns {Array}
/// @pure
function array_flatten(array)
{
    var _store = [];
    var _count = 0;
    var _iteri = array_length(array);
    for (var i = 0; i < _iteri; i++)
    {
        if ( is_array(array[i]) )
        {
            var _subarray = array_flatten(array[i]);
            var _iterj = array_length(_subarray);
            for (var j = 0; j < _iterj; j++)
            {
                _store[_count] = _subarray[j];
                _count++;
            }
        }
        else
        {
            _store[_count] = array[i];
        }
    }
    return _store;
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
/// @param {Array} array The array to cull.
/// @param {Real} limit The limit to impose.
/// @returns {Array}
/// @pure
function array_cull(array, limit)
{
	var _length = array_length(array);
	if ( _length <= limit )
	{
		return array;
	}
	var _store = variable_clone(array);
	if ( _length > limit )
	{
        var _toRemove = _length - limit;
        array_delete(_store, 0, _toRemove);
	}
	return _store;
}

/// @desc Removes the oldest elements from an array if it exceeds a given maximum size.
/// @param {Array} array The array to cull.
/// @param {Real} limit The limit to impose.
function array_cull_ext(array, limit)
{
	var _length = array_length(array);
	if ( _length > limit )
	{
		var _toRemove = _length - limit;
		array_delete(array, 0, _toRemove);
	}
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

/// @desc Adds any number of values to the end of the given array, removing the oldest elements if it exceeds a given maximum size. Add any amount of values after the `limit` argument.
/// @param {Array} array The array to push to.
/// @param {Real} limit The limit to impose.
/// @param {Any|Array<Any>} ...values One or more values or arrays of values.
function array_push_cull(array, limit)
{
	var _length = array_length(array);
    for (var i = 2; i < argument_count; i++)
    {
		if ( is_array(argument[i]) )
		{
			var len = array_length(argument[i]);
			for (var j = 0; j < len; j++)
			{
				array[_length] = argument[i][j];
				_length++;
			}
		}
		else
		{
			array[_length] = argument[i];
			_length++;
		}
    }

    if ( _length > limit )
    {
        var _toRemove = _length - limit;
        array_delete(array, 0, _toRemove);
    }
}

/// @desc Adds any number of values to the end of the given array, but only if its length is at or below the given limit. Add any amount of values after the `limit` argument.
/// @param {Array} array The array to push to.
/// @param {Real} limit The limit to impose.
/// @param {Any|Array<Any>} ...values One or more values or arrays of values.
function array_push_limit(array, limit)
{
	var _len = array_length(array);
	for (var i = 2; i < argument_count && _len < limit; i++)
	{
		if ( is_array(argument[i]) )
		{
			var _tLen = array_length(argument[i]);
			for (var j = 0; j < _tLen && _len < limit; j++)
			{
				array[_len] = argument[i][j];
				_len++;
			}
		}
		else
		{
			array[_len] = argument[i];
			_len++;
		}
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

/// @desc Returns the index of the lowest value in an array or subsection of one. Returns -1 if the array or subsection is empty.
/// @param {Array<Real>} array The array to search.
/// @param {Real} [offset] The index to start from. Negative values count from the end of the array.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset position.
/// @returns {Real}
/// @pure
function array_index_min(array, offset = 0, length = undefined)
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
	if ( length <= 0 ) return -1;
	
	var _index = offset;
	var _min = array[offset];
	for (var i = offset + 1; i < offset + length; i++)
	{
		if ( array[i] < _min )
		{
			_min = array[i];
			_index = i;
		}
	}
	return _index;
}

/// @desc Returns the index of the highest value in an array or subsection of one. Returns -1 if the array or subsection is empty.
/// @param {Array<Real>} array The array to search.
/// @param {Real} [offset] The index to start from. Negative values count from the end of the array.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset position.
/// @returns {Real}
/// @pure
function array_index_max(array, offset = 0, length = undefined)
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
	if ( length <= 0 ) return -1;
	
	var _index = offset;
	var _max = array[offset];
	for (var i = offset + 1; i < offset + length; i++)
	{
		if ( array[i] > _max )
		{
			_max = array[i];
			_index = i;
		}
	}
	return _index;
}

/// @desc Updates all numbers in an array to match the highest value. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_max(arr)
{
    return array_create(array_length(arr), array_max(arr));
}

/// @desc Updates all numbers in an array to match the highest value. Modifies the original array.
/// @param {Array} arr An array containing the numbers to use.
function array_equalise_to_max_ext(arr)
{
    var _max = array_max(arr);
	var _iter = array_length(arr);
	for (var i = 0; i < _iter; i++)
	{
		arr[i] = _max;
	}
}

/// @desc Raises the lowest numbers in an array towards the highest number, using a limited `budget` of increments and distributing increments evenly. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @param {Real} budget How many total increments to allow.
/// @param {Bool} [overflow] If true, values can exceed the original maximum.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_max_budget(arr, budget, overflow = false)
{
    var _new = variable_clone(arr, 0);
    var _len = array_length(_new);
    if ( _len == 0 )
    {
        return _new;
    }

    var _sorted = variable_clone(_new, 0);
    array_sort(_sorted, true);

    for (var i = 0; i < _len - 1 && budget > 0; i++)
    {
        var _diff = _sorted[i + 1] - _sorted[i];
        if ( _diff > 0 )
        {
            var _num_items = i + 1;
            var _cost_to_level = _diff * _num_items;
            var _spend = min(budget, _cost_to_level);
            
            var _add = _spend div _num_items;
            var _rem = _spend % _num_items;
            
            var _threshold = _sorted[i];
            for (var j = 0; j < _len; j++)
            {
                if ( _new[j] <= _threshold )
                {
                    _new[j] += _add;
                    if ( _rem > 0 )
                    {
                        _new[j]++;
                        _rem--;
                    }
                }
            }
            budget -= _spend;
            _sorted[i] += _add;
        }
    }

    if ( overflow && budget > 0 )
    {
        var _add_all = budget div _len;
        var _rem = budget % _len;
        for (var i = 0; i < _len; i++)
        {
            _new[i] += _add_all + (i < _rem ? 1 : 0);
        }
    }
    return _new;
}

/// @desc Raises the lowest numbers in an array towards the highest number, using a limited `budget` of increments and distributing increments evenly. Modifies the original array.
/// @param {Array} arr An array containing the numbers to use.
/// @param {Real} budget How many total increments to allow.
/// @param {Bool} [overflow] If true, values can exceed the original maximum.
function array_equalise_to_max_budget_ext(arr, budget, overflow = false)
{
    var _len = array_length(arr);
    if ( _len == 0 )
    {
        return;
    }

    var _sorted = variable_clone(arr, 0);
    array_sort(_sorted, true);

    for (var i = 0; i < _len - 1 && budget > 0; i++)
    {
        var _diff = _sorted[i + 1] - _sorted[i];
        if ( _diff > 0 )
        {
            var _numItems = i + 1;
            var _costToLevel = _diff * _numItems;
            var _spend = min(budget, _costToLevel);
            
            var _add = _spend div _numItems;
            var _rem = _spend % _numItems;
            
            var _threshold = _sorted[i];
            for (var j = 0; j < _len; j++)
            {
                if ( arr[j] <= _threshold )
                {
                    arr[j] += _add;
                    if ( _rem > 0 )
                    {
                        arr[j]++;
                        _rem--;
                    }
                }
            }
            budget -= _spend;
            _sorted[i] += _add;
        }
    }

    if ( overflow && budget > 0 )
    {
        var _addAll = budget div _len;
        var _finalRem = budget % _len;
        for (var i = 0; i < _len; i++)
        {
            arr[i] += _addAll + (i < _finalRem ? 1 : 0);
        }
    }
}


/// @desc Updates all numbers in an array to match the lowest value. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_min(arr)
{
    return array_create(array_length(arr), array_min(arr));
}

/// @desc Updates all numbers in an array to match the lowest value. Modifies the original array.
/// @param {Array} arr An array containing the numbers to use.
function array_equalise_to_min_ext(arr)
{
    var _min = array_min(arr);
	var _iter = array_length(arr);
	for (var i = 0; i < _iter; i++)
	{
		arr[i] = _min;
	}
}

/// @desc Decreases the highest numbers in an array towards the lowest number, using a limited `budget` of decrements and distributing decrements evenly. Returns a new, adjusted array.
/// @param {Array} arr An array containing the numbers to use.
/// @param {Real} budget How many total decrements to allow.
/// @param {Bool} [underflow] If true, values can be incremented below the original maximum.
/// @returns {Array} A new array with adjusted values.
/// @pure
function array_equalise_to_min_budget(arr, budget, underflow = false)
{
    var _new = variable_clone(arr, 0);
    var _len = array_length(_new);
    if ( _len == 0 )
    {
        return _new;
    }

    var _sorted = variable_clone(_new, 0);
    array_sort(_sorted, false);

    for (var i = 0; i < _len - 1 && budget > 0; i++)
    {
        var _diff = _sorted[i] - _sorted[i + 1];
        if ( _diff > 0 )
        {
            var _num_items = i + 1;
            var _cost_to_level = _diff * _num_items;
            var _spend = min(budget, _cost_to_level);
            
            var _sub = _spend div _num_items;
            var _rem = _spend % _num_items;
            
            var _threshold = _sorted[i];
            for (var j = 0; j < _len; j++)
            {
                if ( _new[j] >= _threshold )
                {
                    _new[j] -= _sub;
                    if ( _rem > 0 )
                    {
                        _new[j]--;
                        _rem--;
                    }
                }
            }
            budget -= _spend;
            _sorted[i] -= _sub;
        }
    }

    if ( underflow && budget > 0 )
    {
        var _sub_all = budget div _len;
        var _rem = budget % _len;
        for (var i = 0; i < _len; i++)
        {
            _new[i] -= _sub_all + (i < _rem ? 1 : 0);
        }
    }
	return _new;
}

/// @desc Decreases the highest numbers in an array towards the lowest number, using a limited `budget` of decrements and distributing decrements evenly. Modifies the original array.
/// @param {Array} arr An array containing the numbers to use.
/// @param {Real} budget How many total decrements to allow.
/// @param {Bool} [underflow] If true, values can be incremented below the original maximum.
function array_equalise_to_min_budget_ext(arr, budget, underflow = false)
{
    var _len = array_length(arr);
    if ( _len == 0 )
    {
        return;
    }

    var _sorted = variable_clone(arr, 0);
    array_sort(_sorted, false);

    for (var i = 0; i < _len - 1 && budget > 0; i++)
    {
        var _diff = _sorted[i] - _sorted[i + 1];
        if ( _diff > 0 )
        {
            var _numItems = i + 1;
            var _costToLevel = _diff * _numItems;
            var _spend = min(budget, _costToLevel);
            
            var _sub = _spend div _numItems;
            var _rem = _spend % _numItems;
            
            var _threshold = _sorted[i];
            for (var j = 0; j < _len; j++)
            {
                if ( arr[j] >= _threshold )
                {
                    arr[j] -= _sub;
                    if ( _rem > 0 )
                    {
                        arr[j]--;
                        _rem--;
                    }
                }
            }
            budget -= _spend;
            _sorted[i] -= _sub;
        }
    }

    if ( underflow && budget > 0 )
    {
        var _subAll = budget div _len;
        var _finalRem = budget % _len;
        for (var i = 0; i < _len; i++)
        {
            arr[i] -= _subAll + (i < _finalRem ? 1 : 0);
        }
    }
}


/// @desc Combines any number of arrays into a single array of sub-arrays, where each sub-array contains the elements at the same index from each input array. If arrays are of unequal length, missing values are filled with the fill argument. Use undefined as the fill value if no specific fill value is needed.
/// @param {Any} fill The value to fill missing elements with. Use undefined if no specific fill value is needed.
/// @param {Array} ...arrays Two or more arrays to zip together.
/// @returns {Array<Array>|Undefined}
/// @pure
function array_zip(fill)
{
	var _maxLen = 0;
	var _argCount = argument_count;
	for (var i = 1; i < _argCount; i++)
	{
		var _arg = argument[i];
		if ( !is_array(_arg) )
		{
			return undefined;
		}
		_maxLen = max(_maxLen, array_length(_arg));
	}
	var _store = array_create(_maxLen);
	var _pairSize = _argCount - 1;
	for (var i = 0; i < _maxLen; i++)
	{
		var _pair = array_create(_pairSize);
		for (var j = 1; j < _argCount; j++)
		{
			var _arr = argument[j];
			if ( i < array_length(_arr) )
			{
				_pair[j - 1] = _arr[i];
			}
			else
			{
				_pair[j - 1] = fill;
			}
		}
		_store[i] = _pair;
	}
	return _store;
}

/// @desc Splits an array of sub-arrays into an array of arrays, one per column. The inverse of `array_zip`.
/// @param {Array} array The zipped array to unzip. Each sub-array must be the same length.
/// @returns {Array<Array>}
/// @pure
function array_unzip(array)
{
	var _len = array_length(array);
	if ( _len == 0 )
	{
		return [];
	}
	var _cols = array_length(array[0]);
	var _store = array_create(_cols);
	for (var i = 0; i < _cols; i++)
	{
		_store[i] = array_create(_len);
	}
	for (var i = 0; i < _len; i++)
	{
		var _row = array[i];
		for (var j = 0; j < _cols; j++)
		{
			_store[j][i] = _row[j];
		}
	}
	return _store;
}

/// @desc Returns an array of n random elements from the given array.
/// @param {Array} array The array to sample from.
/// @param {Real} n The number of elements to retrieve.
/// @param {Bool} [replace] Whether to allow the same element to be picked multiple times (true) or not (false).
/// @returns {Array}
/// @pure
function array_sample(array, n, replace = LK_ARRAY_SAMPLE_REPLACE_DEFAULT)
{
    var _len = array_length(array);
    if ( _len == 0 || n <= 0 )
    {
        return [];
    }

    var _result = array_create(n);
    if ( replace )
    {
        for (var i = 0; i < n; i++)
        {
            _result[i] = array[irandom(_len - 1)];
        }
    }
    else
    {
        if ( n >= _len )
        {
            return array_shuffle(array);
        }

        if ( n < _len / 2 )
        {
            var _used = {};
            var _count = 0;
            while ( _count < n )
            {
                var _idx = irandom(_len - 1);
                var _key = string(_idx);
                if ( !struct_exists(_used, _key) )
                {
                    _used[$ _key] = true;
                    _result[_count] = array[_idx];
                    _count++;
                }
            }
        }
        else
        {
            var _indices = array_create(_len);
            for (var i = 0; i < _len; i++)
            {
                _indices[i] = i;
            }

            for (var i = 0; i < n; i++)
            {
                var _j = irandom_range(i, _len - 1);
                var _temp = _indices[i];
                _indices[i] = _indices[_j];
                _indices[_j] = _temp;
                _result[i] = array[_indices[i]];
            }
        }
    }
    return _result;
}

/// @desc Returns an array of every index in the array where the given value is found. Returns an empty array if the value is not found.
/// @param {Array} array The array to search.
/// @param {Any} value The value to search for.
/// @param {Real} [offset] The index to start searching from. Negative values count from the end of the array. Defaults to 0.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset. Defaults to the full array length.
/// @returns {Array<Real>}
/// @pure
function array_find_index_all(array, value, offset = 0, length = undefined)
{
	var _length = array_length(array);
	length ??= _length;
	
	if ( offset < 0 )
		offset = max(_length + offset, 0);
	
	if ( length < 0 )
	{
		length = min(offset + 1, -length);
		offset -= length - 1;
	}
	
	length = min(_length - offset, length);
	
	var _result = [];
	var _count = 0;
	var _end = offset + length;
	
	for (var i = offset; i < _end; i++)
	{
		if ( array[i] == value )
		{
			_result[_count] = i;
			_count++;
		}
	}
	
	return _result;
}

/// @desc Splits an array or subsection into two arrays based on a predicate, returning them as [[passing], [failing]].
/// @param {Array} array The array to partition.
/// @param {Function} predicate A function that takes (value, index) and returns true or false.
/// @param {Real} [offset] The index to start from. Negative values count from the end of the array.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset position.
/// @returns {Array<Array>}
/// @pure
function array_partition(array, predicate, offset = 0, length = undefined)
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
	if ( length <= 0 ) return [[], []];
	
	var _passing = array_create(length);
	var _failing = array_create(length);
	var _pass_count = 0;
	var _fail_count = 0;
	var _end = offset + length;
	
	for (var i = offset; i < _end; i++)
	{
		var _val = array[i];
		if ( predicate(_val, i) )
		{
			_passing[_pass_count++] = _val;
		}
		else
		{
			_failing[_fail_count++] = _val;
		}
	}
	
	array_resize(_passing, _pass_count);
	array_resize(_failing, _fail_count);
	
	return [_passing, _failing];
}

/// @desc Returns the number of elements in an array or subsection for which the predicate returns true.
/// @param {Array} array The array to search.
/// @param {Function} predicate A function that takes (value, index) and returns true or false.
/// @param {Real} [offset] The index to start from. Negative values count from the end of the array.
/// @param {Real} [length] The number of elements to search. Negative values count backwards from the offset position.
/// @returns {Real}
/// @pure
function array_count_if(array, predicate, offset = 0, length = undefined)
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
	
	var _count = 0;
	var _end = offset + length;
	
	for (var i = offset; i < _end; i++)
	{
		if ( predicate(array[i], i) )
		{
			_count++;
		}
	}
	
	return _count;
}