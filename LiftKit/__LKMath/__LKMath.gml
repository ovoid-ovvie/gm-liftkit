/// @desc Calculates a remainder from the Euclidian division (the remainder will always be non-negative).
/// @param {Real} dividend The dividend (i.e. the value to get the remainder of).
/// @param {Real} divisor The divisor (i.e. the value to divide by).
/// @returns {Real}
function eucmod(dividend, divisor)
{
	var remainder = dividend mod divisor;
	
	if ( remainder >= 0 )
	{
		return ( remainder );
	}
	else if ( divisor > 0 )
	{
		return ( remainder + divisor );
	}
	else
	{
		return ( remainder - divisor );
	}
}

/// @desc Calculates an integer quotient of the Euclidian division (i.e. the division with always non-negative remainder).
/// @param {Real} dividend The dividend (i.e. the value to be divided).
/// @param {Real} divisor The divisor (i.e. the value to divide by).
/// @returns {Real}
function eucdiv(dividend, divisor)
{
	dividend -= eucmod(dividend, divisor);
	return ( dividend div divisor );
}

/// @desc Calculates the value a step closer to the target value. If the target is close enough, returns the target.
/// @param {Real} current The current value.
/// @param {Real} target The target value.
/// @param {Real} [step] The step to approachg the target by (1 by default).
/// @returns {Real}
function approach(current, target, step = 1)
{
	if ( step < 0 )
	{
		return ( current + sign(target - current) * step );
	}
	
	var diff = target - current;
	return ( abs(diff) < step )
		? target
		: current + sign(diff) * step;
}

/// @desc Calculates the angle (in degrees) a step closer to the target angle. If the target is close enough, returns the target.
/// @param {Real} current The current angle.
/// @param {Real} target The target angle.
/// @param {Real} [step] The step to approach the target by (1 by default).
function approach_angle(current, target, step = 1)
{
	if ( step == 0 )
	{
		return current;
	}
	
	if ( step < 0 )
	{
		target = 180 + target;
		step = -step;
	}
	
	var diff = angle_difference(target, current);
	var new_angle = abs(diff) < step
		? target
		: current + sign(diff) * step;
	return ( eucmod(new_angle, 360) );
}

/// @desc Returns the highest value from the supplied arguments. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric argument is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function multimax()
{
	if ( argument_count == 0 )
	{
		return undefined;
	}
	var _highest = -infinity;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_numeric(argument[i][j]) )
				{
					if ( argument[i][j] > _highest )
					{
						_highest = argument[i][j];
					}
				}
				else
				{
					return undefined;
				}
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			if ( argument[i] > _highest )
			{
				_highest = argument[i]
			}
		}
		else
		{
			return undefined;
		}
	}
}

/// @desc Returns the lowest value from the supplied arguments. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric argument is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function multimin()
{
	if ( argument_count == 0 )
	{
		return undefined;
	}
	var _lowest = infinity;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_numeric(argument[i][j]) )
				{
					if ( argument[i][j] < _lowest )
					{
						_lowest = argument[i][j];
					}
				}
				else
				{
					return undefined;
				}
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			if ( argument[i] < _lowest )
			{
				_lowest = argument[i]
			}
		}
		else
		{
			return undefined;
		}
	}
}

/// @desc Returns the highest absolute value from the supplied arguments. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric argument is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function abs_max()
{
	if ( argument_count == 0 ) return undefined;
	var highest = -infinity;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_numeric(argument[i][j]) )
				{
					if ( abs(argument[i][j]) > highest )
					{
						highest = abs(argument[i][j]);
					}
				}
				else
				{
					return undefined;
				}
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			if ( abs(argument[i]) > highest )
			{
				highest = abs(argument[i]);
			}
		}
		else
		{
			return undefined;
		}
	}
	return highest;
}

/// @desc Returns the lowest absolute value from the supplied arguments. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric argument is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function abs_min()
{
	if ( argument_count == 0 ) return undefined;
	var lowest = infinity;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_numeric(argument[i][j]) )
				{
					if ( abs(argument[i][j]) < lowest )
					{
						lowest = abs(argument[i][j]);
					}
					else
					{
						return undefined;
					}
				}
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			if ( abs(argument[i]) < lowest )
			{
				lowest = abs(argument[i]);
			}
		}
		else
		{
			return undefined;
		}
	}
	return lowest;
}

/// @desc Returns the number of digits in n. By default only counts digits before the decimal point.
/// @param {Real} n
/// @param {Bool} [include_decimal] Whether to include digits after the decimal point in the count. Defaults to false.
/// @returns {Real}
/// @pure
function digit_count(n, include_decimal = LK_DIGIT_COUNT_INCLUDE_DECIMAL_DEFAULT)
{
	if ( n == 0 )
	{
		return 1;
	}
	
	var str = string(n);
	var len = string_length(str);
	var count = len;
	
	if ( string_char_at(str, 1) == "-" )
	{
		count--;
	}
	
	var decimal_pos = string_pos(".", str);
	if ( decimal_pos > 0 && !include_decimal )
	{
		count -= (len - decimal_pos + 1);
	}
	else if ( decimal_pos > 0 && include_decimal )
	{
		count--;
	}
	
	return count;
}

/// @desc Compares two reals and returns true if they are within a certain distance of each other.
/// @param {Real} val1 The first value.
/// @param {Real} val2 The second value.
/// @param {Real} dist The maximum allowed distance.
/// @returns {Bool}
/// @pure
function is_approx(val1, val2, dist)
{
	return abs(val1 - val2) <= dist;
}

/// @desc Returns true if n falls within the range r1 to r2. The check is inclusive of the bounds by default.
/// @param {Real} n The value to check.
/// @param {Real} r1 The lower bound of the range.
/// @param {Real} r2 The upper bound of the range.
/// @param {Bool} [exclusive] Whether to exclude the bounds from the check. Defaults to false.
/// @returns {Bool}
/// @pure
function is_between(n, r1, r2, exclusive = LK_IS_BETWEEN_EXCLUSIVE_DEFAULT)
{
	if ( exclusive )
	{
		return ( n > r1 && n < r2 );
	}
	else
	{
		return ( n >= r1 && n <= r2 );
	}
}

/// @desc Returns true if n is even, or false if odd.
/// @param {Real} n
/// @returns {Bool}
/// @pure
function is_even(n)
{
	return ( abs(n) % 2 == 0 );
}

/// @desc Checks if the number value n is a power of two (true) or not (false).
/// @param {Real} n The value to check.
/// @returns {Bool}
/// @pure
function is_pot(n)
{
    return ( n > 0 && (n & (n - 1)) == 0 );
}

/// @desc Checks if the number value n is a power of two (true) or not (false). Alias of `is_pot()`.
/// @param {Real} n The value to check.
/// @returns {Bool}
/// @pure
function is_power_of_two(n)
{
	return ( n > 0 && (n & (n - 1)) == 0 );
}

/// @desc Returns true if n is a whole number, or false if it has a fractional component.
/// @param {Real} n
/// @returns {Bool}
/// @pure
function is_whole(n)
{
	return ( n == floor(n) );
}

/// @desc Returns the mean average of all supplied values. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function multimean()
{
	if ( argument_count == 0 ) return undefined;
	var sum = 0;
	var entries = 0;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				sum += argument[i][j];
				entries++;
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			sum += argument[i];
			entries++;
		}
		else
		{
			return undefined;
		}
	}
	return ( sum / entries );
}

/// @desc Returns the mean average of the absolute values of all supplied values. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function abs_multimean()
{
	if ( argument_count == 0 ) return undefined;
	var sum = 0;
	var entries = 0;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				sum += abs(argument[i][j]);
				entries++;
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			sum += abs(argument[i]);
			entries++;
		}
		else
		{
			return undefined;
		}
	}
	return ( sum / entries );
}

/// @desc Returns the median of all supplied values. For an even number of values, returns the mean of the two middle values. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function multimedian()
{
	if ( argument_count == 0 ) return undefined;
	var values = [];
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				array_push(values, argument[i][j]);
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			array_push(values, argument[i]);
		}
		else
		{
			return undefined;
		}
	}
	var count = array_length(values);
	if ( count == 0 ) return undefined;
	array_sort(values, true);
	if ( count mod 2 == 1 )
	{
		return values[count div 2];
	}
	else
	{
		return ( values[count div 2 - 1] + values[count div 2] ) / 2;
	}
}

/// @desc Returns the median of the absolute values of all supplied values. For an even number of values, returns the mean of the two middle values. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function abs_multimedian()
{
	if ( argument_count == 0 ) return undefined;
	var values = [];
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				array_push(values, abs(argument[i][j]));
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			array_push(values, abs(argument[i]));
		}
		else
		{
			return undefined;
		}
	}
	var count = array_length(values);
	if ( count == 0 ) return undefined;
	array_sort(values, true);
	if ( count mod 2 == 1 )
	{
		return values[count div 2];
	}
	else
	{
		return ( values[count div 2 - 1] + values[count div 2] ) / 2;
	}
}

/// @desc Returns an array of the most frequently occurring values from all supplied values. Returns an array with all values if no single mode exists. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Array<Real>|Undefined}
/// @pure
function multimode()
{
	if ( argument_count == 0 ) return undefined;
	var values = [];
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				array_push(values, argument[i][j]);
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			array_push(values, argument[i]);
		}
		else
		{
			return undefined;
		}
	}
	var count = array_length(values);
	if ( count == 0 ) return undefined;
	var unique = [];
	var freq = [];
	for (var i = 0; i < count; i++)
	{
		var idx = array_get_index(unique, values[i]);
		if ( idx == -1 )
		{
			array_push(unique, values[i]);
			array_push(freq, 1);
		}
		else
		{
			freq[idx]++;
		}
	}
	var highest = array_max(freq);
	var result = [];
	for (var i = 0; i < array_length(unique); i++)
	{
		if ( freq[i] == highest )
		{
			array_push(result, unique[i]);
		}
	}
	return result;
}

/// @desc Returns an array of the most frequently occurring absolute values from all supplied values. Returns an array with all values if no single mode exists. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Array<Real>|Undefined}
/// @pure
function abs_multimode()
{
	if ( argument_count == 0 ) return undefined;
	var values = [];
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				array_push(values, abs(argument[i][j]));
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			array_push(values, abs(argument[i]));
		}
		else
		{
			return undefined;
		}
	}
	var count = array_length(values);
	if ( count == 0 ) return undefined;
	var unique = [];
	var freq = [];
	for (var i = 0; i < count; i++)
	{
		var idx = array_get_index(unique, values[i]);
		if ( idx == -1 )
		{
			array_push(unique, values[i]);
			array_push(freq, 1);
		}
		else
		{
			freq[idx]++;
		}
	}
	var highest = array_max(freq);
	var result = [];
	for (var i = 0; i < array_length(unique); i++)
	{
		if ( freq[i] == highest )
		{
			array_push(result, unique[i]);
		}
	}
	return result;
}

/// @desc Returns the standard deviation of all supplied values. Arguments may be individual reals or arrays of reals. Returns undefined if no arguments are supplied or if a non-numeric value is encountered.
/// @param {Real|Array<Real>} ...values One or more real values or arrays of real values.
/// @returns {Real|Undefined}
/// @pure
function multideviation()
{
	if ( argument_count == 0 ) return undefined;
	var values = [];
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( !is_numeric(argument[i][j]) ) return undefined;
				array_push(values, argument[i][j]);
			}
		}
		else if ( is_numeric(argument[i]) )
		{
			array_push(values, argument[i]);
		}
		else
		{
			return undefined;
		}
	}
	var count = array_length(values);
	if ( count == 0 ) return undefined;
	var _mean = 0;
	for (var i = 0; i < count; i++)
	{
		_mean += values[i];
	}
	_mean /= count;
	var variance = 0;
	for (var i = 0; i < count; i++)
	{
		variance += power(values[i] - _mean, 2);
	}
	return sqrt(variance / count);
}

/// @desc Returns the negative value of n. If n is already negative it will remain unchanged, otherwise it will be multiplied by -1.
/// @param {Real} n
/// @returns {Real}
/// @pure
function neg(n)
{
	return -abs(n);
}

/// @desc Normalises n from the range _min to _max into a value between 0 and 1. Clamps the result to 0-1 by default.
/// @param {Real} n The value to normalise.
/// @param {Real} _min The lower bound of the input range.
/// @param {Real} _max The upper bound of the input range.
/// @param {Bool} [_clamp] Whether to clamp the result between 0 and 1. Defaults to true.
/// @returns {Real}
/// @pure
function normalise(n, _min, _max, _clamp = LK_NORMALISE_CLAMP_DEFAULT)
{
	var result = (n - _min) / (_max - _min);
	return ( _clamp ) ? clamp(result, 0, 1) : result;
}

/// @desc Normalises n from the range _min to _max into a value between 0 and 1. Clamps the result to 0-1 by default. Alias of `normalise()`.
/// @param {Real} n The value to normalize.
/// @param {Real} _min The lower bound of the input range.
/// @param {Real} _max The upper bound of the input range.
/// @param {Bool} [_clamp] Whether to clamp the result between 0 and 1. Defaults to true.
/// @returns {Real}
/// @pure
function normalize(n, _min, _max, _clamp = LK_NORMALISE_CLAMP_DEFAULT)
{
	return ( normalise(n, _min, _max, _clamp) );
}

/// @desc Returns a value that oscillates smoothly between _min and _max over time using a sine wave.
/// @param {Real} time The current time value, typically in seconds.
/// @param {Real} _speed The number of full oscillation cycles per second.
/// @param {Real} _min The lower bound of the oscillation range.
/// @param {Real} _max The upper bound of the oscillation range.
/// @returns {Real}
/// @pure
function oscillate(time, _speed, _min, _max)
{
	return ( normalise(sin(time * _speed), -1, 1) * (_max - _min) + _min );
}

/// @desc Remaps n from one range to another. Equivalent to lerping between out_min and out_max by the normalised position of n within in_min to in_max.
/// @param {Real} n The value to remap.
/// @param {Real} in_min The lower bound of the input range.
/// @param {Real} in_max The upper bound of the input range.
/// @param {Real} out_min The lower bound of the output range.
/// @param {Real} out_max The upper bound of the output range.
/// @returns {Real}
/// @pure
function remap(n, in_min, in_max, out_min, out_max)
{
	return lerp(out_min, out_max, normalise(n, in_min, in_max));
}

/// @desc Rounds a real number up or down to the nearest integer without using banker's rounding.
/// @param {Real} n The number to round.
/// @param {Bool} [away] Whether to round away from zero (true) or towards zero (false) if the number supplied is a half-integer (1.5, 17.5, -2.5, etc.).
/// @returns {Real}
/// @pure
function round_standard(n, away = LK_ROUND_STANDARD_AWAY_DEFAULT)
{
	var f = floor(abs(n));
	var dec = abs(n) - f;
	
	if ( dec >= 0.5 || (dec == 0.5 && away) )
	{
		f++;
	}
	return ( n < 0 ) ? -f : f;
}

/// @desc Rounds a real number to the nearest integer, with half-integers (1.5, 17.5, -2.5, etc.) always rounding toward positive infinity.
/// @param {Real} n
/// @returns {Real}
/// @pure
function round_standard_half_up(n)
{
	var f = floor(n);
	var dec = abs(frac(n));
	
	if ( dec >= 0.5 )
	{
		f++;
	}
	return f;
}

/// @desc Rounds a real number to the nearest integer, with half-integers (1.5, 17.5, -2.5, etc.) always rounding toward negative infinity.
/// @param {Real} n
/// @returns {Real}
/// @pure
function round_standard_half_down(n)
{
	var f = ceil(n);
	var dec = abs(frac(n));
	
	if ( dec <= 0.5 )
	{
		f--;
	}
	return f;
}

/// @desc Rounds n to a given number of decimal places. Returns undefined if an error occurs.
/// @param {Real} n The number to round.
/// @param {Real} digits The number of decimal places to round to.
/// @returns {Real|Undefined}
/// @pure
function round_to_dec(n, digits)
{
	if ( digits == 0 )
	{
		return n - frac(n);
	}
	
	var str_num = string_split(string(n), ".");
	
	try
	{
		if ( string_length(str_num[1]) > digits )
		{
			str_num[1] = string_delete(str_num[1], digits + 1, string_length(str_num[1]) - digits);
		}
		
		return ( real(str_num[0] + "." + str_num[1]) );
	}
	catch(error)
	{
		return undefined;
	}
}

/// @desc Rounds n to the nearest multiple of increment.
/// @param {Real} n The number to round.
/// @param {Real} increment The increment to round to.
/// @returns {Real}
/// @pure
function round_to(n, increment)
{
	return ( round(n / increment) * increment );
}

/// @desc Rounds n down to the nearest multiple of increment.
/// @param {Real} n The number to round.
/// @param {Real} increment The increment to round to.
/// @returns {Real}
/// @pure
function floor_to(n, increment)
{
	return ( floor(n / increment) * increment );
}

/// @desc Rounds n up to the nearest multiple of increment.
/// @param {Real} n The number to round.
/// @param {Real} increment The increment to round to.
/// @returns {Real}
/// @pure
function ceil_to(n, increment)
{
	return ( ceil(n / increment) * increment );
}

/// @desc Flips the sign of n. Positive values become negative and negative values become positive. Unlike multiplying by -1, zero values are returned unchanged regardless of their sign.
/// @param {Real} n
/// @returns {Real}
/// @pure
function sign_flip(n)
{
	if ( sign(n) == 0 ) return n;
	else { return -n; }
}

/// @desc Returns the sign of n as either 1 or -1, never 0. If n is zero, returns 1 by default or -1 if negative_if_zero is true.
/// @param {Real} n
/// @param {Bool} [negative_if_zero] Whether to return -1 when n is zero. Defaults to false.
/// @returns {Real}
/// @pure
function sign_nonzero(n, negative_if_zero = LK_SIGN_NONZERO_NEGATIVE_IF_ZERO_DEFAULT)
{
	if ( negative_if_zero )
	{
		return ( sign(n) == 1 ) ? 1 : -1;
	}
	else
	{
		return ( sign(n) == -1 ) ? -1 : 1;
	}
}

/// @desc Snaps n to the nearest multiple of grid_size, offset by an optional amount.
/// @param {Real} n The value to snap.
/// @param {Real} grid_size The size of the grid to snap to.
/// @param {Real} [offset] An offset applied to the grid origin. Defaults to 0.
/// @returns {Real}
/// @pure
function snap_to_grid(n, grid_size, offset = 0)
{
	return ( round_to(n - offset, grid_size) + offset );
}

/// @desc Snaps n to the nearest power of two.
/// @param {Real} n The value to snap.
/// @returns {Real}
/// @pure
function round_to_pot(n) {
    if (n <= 0) return 1;
    var _f = floor_to_pot(n);
    var _c = ceil_to_pot(n);
    return (n - _f < _c - n) ? _f : _c;
}

/// @desc Snaps n up to the next power of two.
/// @param {Real} n The value to snap.
/// @returns {Real}
/// @pure
function ceil_to_pot(n) {
    if (n <= 0) return 1;
    n--;
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    return n + 1;
}

/// @desc Snaps n down to the previous power of two.
/// @param {Real} n The value to snap.
/// @returns {Real}
/// @pure
function floor_to_pot(n) {
    if (n <= 0) return 0;
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    return n - (n >> 1);
}

/// @desc Snaps n to the next power of two.
/// @param {Real} n The value to snap.
/// @returns {Real}
/// @pure
function next_pot(n) 
{
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    return n + 1;
}

/// @desc Snaps n to the next power of two.
/// @param {Real} n The value to snap.
/// @returns {Real}
/// @pure
function prev_pot(n) 
{
    if ( n <= 1 )
	{
		return 0;
	}
    return floor_to_pot(n - 1);
}


/// @desc Returns the sum of the given arguments.
/// @param {Array|Real} ...values One or more real values or arrays of real values.
/// @returns {Real}
/// @pure
function sum()
{
	var val = 0;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_numeric(argument[i][j]) )
				{
					val += argument[i][j];
				}
				else { return undefined; }
			}
		}
		else
		{
			if ( is_numeric(argument[i]) )
			{
				val += argument[i];
			}
			else { return undefined; }
		}
	}
	return val;
}

/// @desc Returns the sum of the absolute value of the given arguments.
/// @param {Array|Real} ...values One or more real values or arrays of real values.
/// @returns {Real}
/// @pure
function abs_sum()
{
	var val = 0;
	for (var i = 0; i < argument_count; i++)
	{
		if ( is_array(argument[i]) )
		{
			for (var j = 0; j < array_length(argument[i]); j++)
			{
				if ( is_numeric(argument[i][j]) )
				{
					val += abs(argument[i][j]);
				}
				else { return undefined; }
			}
		}
		else
		{
			if ( is_numeric(argument[i]) )
			{
				val += abs(argument[i]);
			}
			else { return undefined; }
		}
	}
	return val;
}

/// @desc Returns the decimal value n as a percentage, clamping the result between 0 and 100 by default.
/// @param {Real} n
/// @param {Bool} [_clamp] Toggles clamping the result.
/// @returns {Real}
/// @pure
function to_pct(n, _clamp = LK_TO_PCT_CLAMP_DEFAULT)
{
	if ( _clamp ) n = clamp(n, 0, 1);
	return n * 100;
}

/// @desc Returns the percentage n as a decimal, clamping the result between 0 and 1 by default.
/// @param {Real} n
/// @param {Bool} [_clamp] Toggles clamping the result.
/// @returns {Real}
/// @pure
function to_dec(n, _clamp = LK_TO_DEC_CLAMP_DEFAULT)
{
	if ( _clamp ) n = clamp(n, 0, 100);
	return n / 100;
}

/// @desc Converts a number of seconds to an equivalent number of steps at the current game speed.
/// @param {Real} seconds The number of seconds to convert.
/// @param {Constant.GameSpeed} [type] The game speed type to use. Defaults to gamespeed_fps.
/// @returns {Real}
function to_steps(seconds, type = LK_TO_STEPS_TYPE_DEFAULT)
{
	return ( seconds * game_get_speed(type) );
}

/// @desc Converts a number of steps to an equivalent number of seconds at the current game speed.
/// @param {Real} steps The number of steps to convert.
/// @param {Constant.GameSpeed} [type] The game speed type to use. Defaults to gamespeed_fps.
/// @returns {Real}
function to_seconds(steps, type = LK_TO_SECONDS_TYPE_DEFAULT)
{
	return ( steps / game_get_speed(type) );
}

/// @desc Truncates n toward zero, removing any fractional component without rounding away from zero.
/// @param {Real} n
/// @returns {Real}
/// @pure
function trunc(n)
{
	return n - frac(n);
}

/// @desc Wraps n within the range min to max, looping around when the value exceeds either bound. Returns undefined if _min and _max are equal.
/// @param {Real} n The value to wrap.
/// @param {Real} min The lower bound of the range.
/// @param {Real} max The upper bound of the range.
/// @returns {Real|Undefined}
/// @pure
function wrap(n, _min, _max)
{
	var _range = _max - _min;
	if ( _range == 0 ) return undefined;
	return ((n - _min) mod _range + _range) mod _range + _min;
}

/// @desc Lerps between two angles through the shortest arc, wrapping correctly around 0/360.
/// @param {Real} a The starting angle in degrees.
/// @param {Real} b The target angle in degrees.
/// @param {Real} t The interpolation factor between 0 and 1.
/// @returns {Real}
/// @pure
function lerp_angle(a, b, t)
{
	var _diff = angle_difference(b, a);
	return eucmod(a + _diff * t, 360);
}

/// @desc Maps any real number to a value between 0 and 1 along a smooth S-curve.
/// @param {Real} x The input value.
/// @returns {Real}
/// @pure
function sigmoid(x)
{
	return 1 / (1 + power(2.71828182845904523536, -x));
}

/// @desc Clamps an angle within a given range, respecting wraparound at 0/360.
/// @param {Real} angle The angle to clamp in degrees.
/// @param {Real} min_angle The minimum allowed angle in degrees.
/// @param {Real} max_angle The maximum allowed angle in degrees.
/// @returns {Real}
/// @pure
function clamp_angle(angle, min_angle, max_angle)
{
	angle = eucmod(angle, 360);
	min_angle = eucmod(min_angle, 360);
	max_angle = eucmod(max_angle, 360);
	
	if ( min_angle <= max_angle )
	{
		return clamp(angle, min_angle, max_angle);
	}
	
	if ( angle >= min_angle || angle <= max_angle )
	{
		return angle;
	}
	
	var _dist_min = min(abs(angle - min_angle), 360 - abs(angle - min_angle));
	var _dist_max = min(abs(angle - max_angle), 360 - abs(angle - max_angle));
	return ( _dist_min < _dist_max ) ? min_angle : max_angle;
}

/// @desc Returns e (2.71828), also known as Euler's number.
function euler()
{
	return 2.71828;
}