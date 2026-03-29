# Math

An extended math module covering statistics, rounding modes, normalisation, and the `multi*` variadic+array family.

## The `multi*` Family

Functions prefixed with `multi` (and their `abs_` variants) accept any combination of individual values and arrays as arguments:

```gml
multimean(1, 2, 3)
multimean(my_array)
multimean(1, my_array, 3)
multimean(array_a, array_b)
```

This bridges a gap in GML where native functions like `max`, `min`, and `mean` are variadic only and cannot accept arrays.

---

## abs_max -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L79)

```gml
abs_max(...)
```

Returns the highest absolute value from the supplied arguments. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## abs_min -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L114)

```gml
abs_min(...)
```

Returns the lowest absolute value from the supplied arguments. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## abs_multimean -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L253)

```gml
abs_multimean(...)
```

Returns the mean average of the absolute values of all supplied values. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## abs_multimedian -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L326)

```gml
abs_multimedian(...)
```

Returns the median of the absolute values of all supplied values. For an even number of values, returns the mean of the two middle values. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## abs_multimode -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L422)

```gml
abs_multimode(...)
```

Returns an array of the most frequently occurring absolute values. If all values are equally frequent, returns an array containing all of them. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Array<Real> | Undefined`

---

## abs_sum -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L758)

```gml
abs_sum(...)
```

Returns the sum of the absolute values of all supplied arguments. Returns `undefined` if a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## approach -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L38)

```gml
approach(current, target, step)
```

Returns `current` moved toward `target` by `step`. If the distance to `target` is less than `step`, returns `target` exactly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `current` | `Real` | The current value. |
| `target` | `Real` | The target value. |
| `step` | `Real` | *(optional)* The amount to move per call. Defaults to `1`. |

**Returns:** `Real`

```gml
speed = approach(speed, max_speed, acceleration);
```

---

## approach_angle -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L55)

```gml
approach_angle(current, target, step)
```

Returns `current` angle moved toward `target` angle by `step` degrees, correctly handling wraparound. If the distance is less than `step`, returns `target` exactly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `current` | `Real` | The current angle in degrees. |
| `target` | `Real` | The target angle in degrees. |
| `step` | `Real` | *(optional)* The degrees to move per call. Defaults to `1`. |

**Returns:** `Real`

---

## ceil_to -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L679)

```gml
ceil_to(n, increment)
```

Rounds `n` up to the nearest multiple of `increment`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |
| `increment` | `Real` | The increment to round to. |

**Returns:** `Real`

---

## digit_count -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L150)

```gml
digit_count(n, include_decimal)
```

Returns the number of digits in `n`. By default only counts digits before the decimal point. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to count digits of. |
| `include_decimal` | `Bool` | *(optional)* Whether to include digits after the decimal point. Defaults to `false`. |

**Returns:** `Real`

---

## eucdiv -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L27)

```gml
eucdiv(dividend, divisor)
```

Returns the integer quotient of the Euclidean division of `dividend` by `divisor`. Unlike GML's `div`, the remainder in Euclidean division is always non-negative.

| Parameter | Type | Description |
|-----------|------|-------------|
| `dividend` | `Real` | The value to divide. |
| `divisor` | `Real` | The value to divide by. |

**Returns:** `Real`

---

## eucmod -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L5)

```gml
eucmod(dividend, divisor)
```

Returns the remainder of the Euclidean division of `dividend` by `divisor`. Unlike GML's `mod`, the result is always non-negative.

| Parameter | Type | Description |
|-----------|------|-------------|
| `dividend` | `Real` | The value to get the remainder of. |
| `divisor` | `Real` | The value to divide by. |

**Returns:** `Real`

```gml
eucmod(-1, 4)  // 3  (GML's mod would return -1)
eucmod(7, 4)   // 3
```

---

## floor_to -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L669)

```gml
floor_to(n, increment)
```

Rounds `n` down to the nearest multiple of `increment`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |
| `increment` | `Real` | The increment to round to. |

**Returns:** `Real`

---

## is_between -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L186)

```gml
is_between(n, r1, r2, exclusive)
```

Returns `true` if `n` falls within the range `r1` to `r2`. Inclusive of bounds by default. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to check. |
| `r1` | `Real` | The lower bound. |
| `r2` | `Real` | The upper bound. |
| `exclusive` | `Bool` | *(optional)* Whether to exclude the bounds from the check. Defaults to `false`. |

**Returns:** `Bool`

---

## is_even -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L202)

```gml
is_even(n)
```

Returns `true` if `n` is even, or `false` if odd.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to check. |

**Returns:** `Bool`

---

## is_whole -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L211)

```gml
is_whole(n)
```

Returns `true` if `n` is a whole number with no fractional component.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to check. |

**Returns:** `Bool`

---

## multimean -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L220)

```gml
multimean(...)
```

Returns the mean average of all supplied values. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## multimedian -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L286)

```gml
multimedian(...)
```

Returns the median of all supplied values. For an even number of values, returns the mean of the two middle values. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## multideviation -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L478)

```gml
multideviation(...)
```

Returns the standard deviation of all supplied values. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## multimode -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L366)

```gml
multimode(...)
```

Returns an array of the most frequently occurring values. If all values are equally frequent, returns an array containing all of them. Returns `undefined` if no arguments are supplied or a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Array<Real> | Undefined`

---

## neg -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L521)

```gml
neg(val)
```

Returns the negative absolute value of `val`. If `val` is already negative it is returned unchanged; if positive it is multiplied by `-1`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `val` | `Real` | The value to negate. |

**Returns:** `Real`

---

## normalise / normalize -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L533)

```gml
normalise(n, _min, _max, _clamp)
normalize(n, _min, _max, _clamp)
```

Maps `n` from the range `_min` to `_max` into a 0–1 value. Clamps the result by default. `normalize` is an alias of `normalise`. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to normalise. |
| `_min` | `Real` | The lower bound of the input range. |
| `_max` | `Real` | The upper bound of the input range. |
| `_clamp` | `Bool` | *(optional)* Whether to clamp the result to 0–1. Defaults to `true`. |

**Returns:** `Real`

```gml
var fill = normalise(hp, 0, max_hp);
draw_rectangle(bar_x, bar_y, bar_x + bar_w * fill, bar_y + bar_h, false);
```

---

## oscillate -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L558)

```gml
oscillate(time, _speed, _min, _max)
```

Returns a value that smoothly oscillates between `_min` and `_max` using a sine wave.

| Parameter | Type | Description |
|-----------|------|-------------|
| `time` | `Real` | The current time value, typically in seconds. |
| `_speed` | `Real` | The number of full oscillation cycles per second. |
| `_min` | `Real` | The lower bound of the oscillation range. |
| `_max` | `Real` | The upper bound of the oscillation range. |

**Returns:** `Real`

```gml
// Bob an object up and down
y = base_y + oscillate(current_time / 1000, 2, -4, 4);
```

---

## remap -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L571)

```gml
remap(n, in_min, in_max, out_min, out_max)
```

Maps `n` from one range to another. Equivalent to lerping between `out_min` and `out_max` by the normalised position of `n` within `in_min` to `in_max`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to remap. |
| `in_min` | `Real` | The lower bound of the input range. |
| `in_max` | `Real` | The upper bound of the input range. |
| `out_min` | `Real` | The lower bound of the output range. |
| `out_max` | `Real` | The upper bound of the output range. |

**Returns:** `Real`

```gml
// Map a difficulty slider (0-10) to enemy speed (100-300)
var speed = remap(difficulty, 0, 10, 100, 300);
```

---

## round_standard -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L581)

```gml
round_standard(n, away)
```

Rounds `n` to the nearest integer without banker's rounding. For half-integers, rounds away from zero by default. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |
| `away` | `Bool` | *(optional)* If `true`, half-integers round away from zero. If `false`, toward zero. Defaults to `true`. |

**Returns:** `Real`

---

## round_standard_half_down -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L613)

```gml
round_standard_half_down(n)
```

Rounds `n` to the nearest integer, with half-integers always rounding toward negative infinity.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |

**Returns:** `Real`

| Input | Result |
|-------|--------|
| `2.5` | `2` |
| `-2.5` | `-3` |
| `2.7` | `3` |

---

## round_standard_half_up -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L597)

```gml
round_standard_half_up(n)
```

Rounds `n` to the nearest integer, with half-integers always rounding toward positive infinity.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |

**Returns:** `Real`

| Input | Result |
|-------|--------|
| `2.5` | `3` |
| `-2.5` | `-2` |
| `2.7` | `3` |

---

## round_to -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L659)

```gml
round_to(n, increment)
```

Rounds `n` to the nearest multiple of `increment`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |
| `increment` | `Real` | The increment to round to. |

**Returns:** `Real`

```gml
round_to(37, 5)   // 35
round_to(38, 5)   // 40
```

---

## round_to_dec -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L630)

```gml
round_to_dec(n, digits)
```

Rounds `n` to a given number of decimal places. Returns `undefined` if an error occurs.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to round. |
| `digits` | `Real` | The number of decimal places to round to. |

**Returns:** `Real | Undefined`

---

## sign_flip -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L688)

```gml
sign_flip(n)
```

Flips the sign of `n`. Positive values become negative and negative values become positive. Unlike multiplying by `-1`, zero values are returned unchanged regardless of their sign state.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to flip. |

**Returns:** `Real`

---

## sign_nonzero -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L699)

```gml
sign_nonzero(n, negative_if_zero)
```

Returns the sign of `n` as either `1` or `-1`, never `0`. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to get the sign of. |
| `negative_if_zero` | `Bool` | *(optional)* If `true`, returns `-1` when `n` is zero. If `false`, returns `1`. Defaults to `false`. |

**Returns:** `Real`

---

## snap_to_grid -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L717)

```gml
snap_to_grid(n, grid_size, offset)
```

Snaps `n` to the nearest multiple of `grid_size`, with an optional offset to shift the grid origin.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to snap. |
| `grid_size` | `Real` | The grid cell size. |
| `offset` | `Real` | *(optional)* An offset applied to the grid origin. Defaults to `0`. |

**Returns:** `Real`

```gml
snap_to_grid(37, 16)      // 32
snap_to_grid(37, 16, 8)   // 40  (grid offset by 8)
```

---

## sum -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L726)

```gml
sum(...)
```

Returns the sum of all supplied arguments. Returns `undefined` if a non-numeric value is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real \| Array<Real>` | One or more real values or arrays of real values. |

**Returns:** `Real | Undefined`

---

## to_dec -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L802)

```gml
to_dec(n, _clamp)
```

Converts a percentage to a decimal. Clamps the input to 0–100 by default. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The percentage to convert. |
| `_clamp` | `Bool` | *(optional)* Whether to clamp the input to 0–100. Defaults to `true`. |

**Returns:** `Real`

---

## to_pct -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L791)

```gml
to_pct(n, _clamp)
```

Converts a decimal to a percentage. Clamps the input to 0–1 by default. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The decimal to convert. |
| `_clamp` | `Bool` | *(optional)* Whether to clamp the input to 0–1. Defaults to `true`. |

**Returns:** `Real`

---

## to_seconds -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L821)

```gml
to_seconds(steps, type)
```

Converts a number of steps to the equivalent duration in seconds at the current game speed. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `steps` | `Real` | The number of steps to convert. |
| `type` | `Constant.GameSpeed` | *(optional)* The game speed constant to use. Defaults to `gamespeed_fps`. |

**Returns:** `Real`

---

## to_steps -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L812)

```gml
to_steps(seconds, type)
```

Converts a duration in seconds to the equivalent number of steps at the current game speed. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `seconds` | `Real` | The number of seconds to convert. |
| `type` | `Constant.GameSpeed` | *(optional)* The game speed constant to use. Defaults to `gamespeed_fps`. |

**Returns:** `Real`

```gml
// Set a timer that lasts 3 seconds regardless of game speed
timer = to_steps(3);
```

---

## trunc -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L830)

```gml
trunc(n)
```

Removes the fractional component of `n`, rounding toward zero. Unlike `floor`, negative numbers round toward zero rather than away from it.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The number to truncate. |

**Returns:** `Real`

| Input | `trunc` | `floor` |
|-------|---------|---------|
| `2.7` | `2` | `2` |
| `-2.7` | `-2` | `-3` |

---

## wrap -- [source](../../LiftKit/scripts/LKMath/LKMath.gml#L841)

```gml
wrap(n, _min, _max)
```

Wraps `n` within the range `_min` to `_max`, looping around when the value exceeds either bound. Returns `undefined` if `_min` and `_max` are equal.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Real` | The value to wrap. |
| `_min` | `Real` | The lower bound of the range. |
| `_max` | `Real` | The upper bound of the range. |

**Returns:** `Real | Undefined`

```gml
wrap(370, 0, 360)    // 10
wrap(-10, 0, 360)    // 350
wrap(27, 5, 25)      // 7
```
