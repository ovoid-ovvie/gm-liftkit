/// @desc Converts a DS List to an array and returns the result.
/// @param {Id.DsList} list The ID of the list to convert.
/// @param {Bool} destroy Whether to destroy the list after converting (true) or not (false).
/// @returns {Array}
/// @pure
function ds_list_to_array(list, destroy)
{
	var _size = ds_list_size(list);
	var _array = array_create(_size);
	for (var i = 0; i < _size; i++)
	{
		_array[i] = list[| i];
	}
	if ( destroy )
	{
		ds_list_destroy(list);
	}
	return _array;
}


/// @desc Adds items from the given array to the given DS List.
/// @param {Id.DsList} list The list to add the items to.
/// @param {Array} array The array to get the items from.
function ds_list_add_from_array(list, array)
{
    var _offset = ds_list_size(list);
    var _length = array_length(array);
    for (var i = _length - 1; i >= 0; i--) {
        list[| _offset + i] = array[i];
    }
}

/// @desc Creates a new DS List with items from the given array.
/// @param {Array} array The array to get the items from.
/// @returns {Id.DsList}
function ds_list_create_from_array(array)
{
	var _list = ds_list_create();
	ds_list_add_from_array(_list, array);
	return _list;
}

/// @desc Adds items from the given DS List to the given array.
/// @param {Id.DsList} list The list to get the items from.
/// @param {Array} array The array to add the items to.
function ds_list_add_to_array(list, array)
{
	var _offset = array_length(array);
	var _size = ds_list_size(list);
	array_resize(array, _offset + _size);
	for (var i = 0; i < _size; i++)
	{
		array[_offset + i] = list[| i];
	}
}