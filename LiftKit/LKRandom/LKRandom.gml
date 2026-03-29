/// @desc Rolls a random chance from 0 to 100 percent, returning true or false. Accepts decimals and full percentages.
/// @param {Real} chance
/// @param {Bool} [toggle_clamp] Toggles clamping the result. Defaults to true unless changed in __LKConfig
/// @returns {Bool}
function rand_chance(chance, toggle_clamp = LK_RAND_CHANCE_CLAMP_DEFAULT)
{
    if ( chance > 1 ) then chance /= 100;
    if ( toggle_clamp ) then chance = clamp(chance, 0, 1);
    return ( random(1) <= chance );
}

/// @desc Randomly returns either true or false.
/// @returns {Bool}
function flip_coin()
{
    return ( irandom(1) == 0 );
}

/// @desc Weights every option except the first and last, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_flatten(array, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	var store = variable_clone(array);
	
	for (var i = 1; i < length - 1; i++)
	{
		repeat (strength)
		{
			array_push(store, array[i]);
		}
	}
	
	return array_get_random(store);
}

/// @desc Weights only the first and last options, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_sharpen(array, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	var store = variable_clone(array);
	
	repeat (strength)
	{
		array_push(store, array[0]);
		array_push(store, array[length - 1]);
	}
	
	return array_get_random(store);
}

/// @desc Weights every element at the specified indexes, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real|Array<Real>} indexes The index or array of indexes to weight.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_snipe(array, indexes, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	if ( !is_array(indexes) ) indexes = [indexes];
	
	var store = variable_clone(array);
	
	for (var i = 0; i < array_length(indexes); i++)
	{
		var index = indexes[i];
		if ( is_numeric(index) && index >= 0 && index < length )
		{
			repeat (strength)
			{
				array_push(store, array[index]);
			}
		}
	}
	
	return array_get_random(store);
}

/// @desc Weights every element except those at the specified indexes, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real|Array<Real>} indexes The index or array of indexes to exclude from weighting.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_starve(array, indexes, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	if ( !is_array(indexes) ) indexes = [indexes];
	
	var store = variable_clone(array);
	
	for (var i = 0; i < length; i++)
	{
		if ( !array_contains(indexes, i) )
		{
			repeat (strength)
			{
				array_push(store, array[i]);
			}
		}
	}
	
	return array_get_random(store);
}

/// @desc Weights every second element starting from index 0, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_alternate(array, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	var store = variable_clone(array);
	
	for (var i = 0; i < length; i += 2)
	{
		repeat (strength)
		{
			array_push(store, array[i]);
		}
	}
	
	return array_get_random(store);
}

/// @desc Weights a number of randomly chosen elements, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @param {Real} [count] The number of random elements to weight. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_random(array, strength = 1, count = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	var store = variable_clone(array);
	
	repeat (count)
	{
		var choice = irandom(length - 1);
		repeat (strength)
		{
			array_push(store, array[choice]);
		}
	}
	
	return array_get_random(store);
}

/// @desc Weights the first, second, second-to-last, and last elements, then returns a random element from the weighted array. Requires at least 5 elements.
/// @param {Array} array The array to roll from.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_edge(array, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length < 5 ) return undefined;
	
	var store = variable_clone(array);
	
	repeat (strength)
	{
		array_push(store, array[0]);
		array_push(store, array[1]);
		array_push(store, array[length - 2]);
		array_push(store, array[length - 1]);
	}
	
	return array_get_random(store);
}

/// @desc Weights every element between two specified indexes inclusive, then returns a random element from the weighted array.
/// @param {Array} array The array to roll from.
/// @param {Real} start_index The index to start weighting from.
/// @param {Real} end_index The index to stop weighting at.
/// @param {Real} [strength] The number of times each weighted element is duplicated. Defaults to 1.
/// @returns {Any|Undefined}
function weighted_roll_focus(array, start_index, end_index, strength = 1)
{
	if ( !is_array(array) || !is_numeric(strength) || strength < 0 ) return undefined;
	var length = array_length(array);
	if ( length == 0 ) return undefined;
	
	var store = variable_clone(array);
	
	start_index = clamp(start_index, 0, length - 1);
	end_index = clamp(end_index, 0, length - 1);
	
	if ( start_index > end_index )
	{
		var temp = start_index;
		start_index = end_index;
		end_index = temp;
	}
	
	for (var i = start_index; i <= end_index; i++)
	{
		repeat (strength)
		{
			array_push(store, array[i]);
		}
	}
	
	return array_get_random(store);
}