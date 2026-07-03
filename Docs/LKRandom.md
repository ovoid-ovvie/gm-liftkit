# Random

Probability utilities and a family of weighted random roll functions.

---

## flip_coin

[source](../LiftKit/__LKRandom/__LKRandom.gml#L35)

```gml
flip_coin()
```

Randomly returns either `true` or `false` with equal probability.

**Returns:** `Bool`

```gml
var facing_right = flip_coin();
```

---

## rand_chance

[source](../LiftKit/__LKRandom/__LKRandom.gml#L5)

```gml
rand_chance(chance, toggle_clamp)
```

Returns `true` or `false` based on the given probability, expressed as a value from 0 to 1. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `chance` | `Real` | The probability as a value from 0 to 1. |
| `toggle_clamp` | `Bool` | *(optional)* Whether to clamp the probability to a valid range. Defaults to `true`. |

**Returns:** `Bool`

```gml
if ( rand_chance(0.15) )  // 15% chance
if ( rand_chance(0.5) )   // 50% chance
```

---

## rand_chance_ext

[source](../LiftKit/__LKRandom/__LKRandom.gml#L13)

```gml
rand_chance_ext(...)
```

Rolls a random chance and returns the index of the bucket it lands in. Each argument is a probability (0-100%) expressed as a value from 0 to 1, automatically sorted to ensure correct function. Returns `undefined` if no arguments are supplied. Otherwise, the return value will match the index of the largest argument provided which the roll falls under, indicating which bucket the roll lands in.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Real` | Probability thresholds from 0 to 1. |

**Returns:** `Real | Undefined`

```gml
// 30% chance of index 0, 50% chance of index 1, 20% chance of neither
var bucket = rand_chance_ext(0.3, 0.8);
```

---

## weighted_roll_alternate

[source](../LiftKit/__LKRandom/__LKRandom.gml#L147)

```gml
weighted_roll_alternate(array, strength)
```

Weights every second element starting from index 0, then returns a random element from the weighted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## weighted_roll_edge

[source](../LiftKit/__LKRandom/__LKRandom.gml#L195)

```gml
weighted_roll_edge(array, strength)
```

Weights the first, second, second-to-last, and last elements, then returns a random element from the weighted array. Requires at least 5 elements.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## weighted_roll_flatten

[source](../LiftKit/__LKRandom/__LKRandom.gml#L35)

```gml
weighted_roll_flatten(array, strength)
```

Weights every element except the first and last, making extreme values less likely and mid-range values more likely. Returns a random element from the weighted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## weighted_roll_focus

[source](../LiftKit/__LKRandom/__LKRandom.gml#L220)

```gml
weighted_roll_focus(array, start_index, end_index, strength)
```

Weights every element between `start_index` and `end_index` inclusive, then returns a random element from the weighted array. If `start_index` is greater than `end_index`, they are swapped automatically.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `start_index` | `Real` | The index to start weighting from. |
| `end_index` | `Real` | The index to stop weighting at. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## weighted_roll_random

[source](../LiftKit/__LKRandom/__LKRandom.gml#L171)

```gml
weighted_roll_random(array, strength, count)
```

Weights a number of randomly chosen elements, then returns a random element from the weighted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |
| `count` | `Real` | *(optional)* The number of random elements to weight. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## weighted_roll_sharpen

[source](../LiftKit/__LKRandom/__LKRandom.gml#L67)

```gml
weighted_roll_sharpen(array, strength)
```

Weights only the first and last elements, making extreme values more likely. Returns a random element from the weighted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## weighted_roll_snipe

[source](../LiftKit/__LKRandom/__LKRandom.gml#L89)

```gml
weighted_roll_snipe(array, indexes, strength)
```

Weights every element at the specified index or indexes, then returns a random element from the weighted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `indexes` | `Real \| Array<Real>` | A single index or array of indexes to weight. |
| `strength` | `Real` | *(optional)* The number of times each weighted element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

```gml
// Heavily favour index 0
weighted_roll_snipe(loot_table, 0, 5);

// Favour both index 0 and index 3
weighted_roll_snipe(loot_table, [0, 3], 5);
```

---

## weighted_roll_starve

[source](../LiftKit/__LKRandom/__LKRandom.gml#L119)

```gml
weighted_roll_starve(array, indexes, strength)
```

Weights every element except those at the specified index or indexes, making excluded elements less likely. Returns a random element from the weighted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to roll from. |
| `indexes` | `Real \| Array<Real>` | A single index or array of indexes to exclude from weighting. |
| `strength` | `Real` | *(optional)* The number of times each non-excluded element is duplicated. Defaults to `1`. |

**Returns:** `Any | Undefined`

---

## Weighted Roll Comparison

| Function | Effect |
|----------|--------|
| `weighted_roll_flatten` | Favours middle values |
| `weighted_roll_sharpen` | Favours extreme values (first and last) |
| `weighted_roll_snipe` | Favours specific indexes |
| `weighted_roll_starve` | Disfavours specific indexes |
| `weighted_roll_alternate` | Favours every second element |
| `weighted_roll_random` | Favours randomly chosen elements |
| `weighted_roll_edge` | Favours the first two and last two elements |
| `weighted_roll_focus` | Favours a contiguous range of indexes |
