# Array

Array utilities with subsection support, equalisation, zip/unzip, and more.

---

## array_chunk

[source](../../LiftKit/__LKArray/__LKArray.gml#L14)

```gml
array_chunk(arr, size)
```

Splits an array into a series of smaller arrays of a specified size. The last chunk may be smaller than `size` if the array does not divide evenly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array` | The array to split. |
| `size` | `Real` | The maximum number of elements per chunk. |

**Returns:** `Array<Array>`

```gml
var chunks = array_chunk([1,2,3,4,5], 2);
// [[1,2], [3,4], [5]]
```

---

## array_count_if

[source](../../LiftKit/__LKArray/__LKArray.gml#L942)

```gml
array_count_if(array, predicate, offset, length)
```

Returns the number of elements in an array for which the predicate function returns `true`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to count from. |
| `predicate` | `Function` | A function that takes a value and returns `true` or `false`. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to check. Defaults to the full array length. |

**Returns:** `Real`

```gml
var alive_count = array_count_if(enemies, function(e) { return e.hp > 0; });
```

---

## array_cull

[source](../../LiftKit/__LKArray/__LKArray.gml#L132)

```gml
array_cull(array, limit)
```

Returns a copy of the array with the oldest (first) elements removed until it is at or below the given limit. Does not modify the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to cull. |
| `limit` | `Real` | The maximum number of elements to keep. |

**Returns:** `Array`

---

## array_cull_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L151)

```gml
array_cull_ext(array, limit)
```

Removes the oldest (first) elements from an array if it exceeds the limit. Unlike `array_cull`, this modifies the original array directly rather than returning a new one.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to cull. |
| `limit` | `Real` | The maximum number of elements to keep. |

---

## array_empty

[source](../../LiftKit/__LKArray/__LKArray.gml#L5)

```gml
array_empty(array)
```

Returns `true` if the array has no elements, or `false` if it contains at least one.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to check. |

**Returns:** `Bool`

---

## array_equalise_to_max

[source](../../LiftKit/__LKArray/__LKArray.gml#L439)

```gml
array_equalise_to_max(arr)
```

Returns a new array with all values set to the highest value in the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |

**Returns:** `Array<Real>`

---

## array_equalise_to_max_budget

[source](../../LiftKit/__LKArray/__LKArray.gml#L462)

```gml
array_equalise_to_max_budget(arr, budget, overflow)
```

Raises the lowest values in an array toward the highest value, spending a limited budget of increments distributed evenly across the lowest values. Returns a new adjusted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |
| `budget` | `Real` | The total number of increments available. |
| `overflow` | `Bool` | *(optional)* If `true`, values may exceed the original maximum. Defaults to `false`. |

**Returns:** `Array<Real>`

---

## array_equalise_to_max_budget_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L520)

```gml
array_equalise_to_max_budget_ext(arr, budget, overflow)
```

Raises the lowest values in an array toward the highest value, spending a limited budget of increments. Unlike `array_equalise_to_max_budget`, this modifies the original array directly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |
| `budget` | `Real` | The total number of increments available. |
| `overflow` | `Bool` | *(optional)* If `true`, values may exceed the original maximum. Defaults to `false`. |

---

## array_equalise_to_max_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L446)

```gml
array_equalise_to_max_ext(arr)
```

Sets all values in an array to the highest value in that array. Unlike `array_equalise_to_max`, this modifies the original array directly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |

---

## array_equalise_to_min

[source](../../LiftKit/__LKArray/__LKArray.gml#L577)

```gml
array_equalise_to_min(arr)
```

Returns a new array with all values set to the lowest value in the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |

**Returns:** `Array<Real>`

---

## array_equalise_to_min_budget

[source](../../LiftKit/__LKArray/__LKArray.gml#L600)

```gml
array_equalise_to_min_budget(arr, budget, underflow)
```

Decreases the highest values in an array toward the lowest value, spending a limited budget of decrements distributed evenly across the highest values. Returns a new adjusted array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |
| `budget` | `Real` | The total number of decrements available. |
| `underflow` | `Bool` | *(optional)* If `true`, values may go below the original minimum. Defaults to `false`. |

**Returns:** `Array<Real>`

---

## array_equalise_to_min_budget_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L658)

```gml
array_equalise_to_min_budget_ext(arr, budget, underflow)
```

Decreases the highest values in an array toward the lowest value, spending a limited budget of decrements. Unlike `array_equalise_to_min_budget`, this modifies the original array directly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |
| `budget` | `Real` | The total number of decrements available. |
| `underflow` | `Bool` | *(optional)* If `true`, values may go below the original minimum. Defaults to `false`. |

---

## array_equalise_to_min_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L584)

```gml
array_equalise_to_min_ext(arr)
```

Sets all values in an array to the lowest value in that array. Unlike `array_equalise_to_min`, this modifies the original array directly.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |

---

## array_find_index_all

[source](../../LiftKit/__LKArray/__LKArray.gml#L852)

```gml
array_find_index_all(array, value, offset, length)
```

Returns an array of every index where the given value is found. Returns an empty array if the value isn't found anywhere. This is the multi-match version of GML's `array_get_index`, which only returns the first match.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to search. |
| `value` | `Any` | The value to search for. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to search. Defaults to the full array length. |

**Returns:** `Array<Real>`

```gml
var positions = array_find_index_all(tiles, TILE.WATER);
// [2, 5, 9, 14] -- every index where a water tile was found
```

---

## array_flatten

[source](../../LiftKit/__LKArray/__LKArray.gml#L39)

```gml
array_flatten(array)
```

Flattens a nested array into a single-dimensional array. Recursively flattens sub-arrays at any depth.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to flatten. |

**Returns:** `Array`

```gml
var flat = array_flatten([1, [2, [3, 4]], 5]);
// [1, 2, 3, 4, 5]
```

---

## array_get_random

[source](../../LiftKit/__LKArray/__LKArray.gml#L69)

```gml
array_get_random(array, offset, length)
```

Returns a random element from the array or a subsection of it. Returns `undefined` if the array or subsection is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to pick from. |
| `offset` | `Real` | *(optional)* The starting index. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to pick from. Negative values count backwards from the offset. Defaults to the full array length. |

**Returns:** `Any | Undefined`

---

## array_index_max

[source](../../LiftKit/__LKArray/__LKArray.gml#L403)

```gml
array_index_max(array, offset, length)
```

Returns the index of the highest value in an array or subsection of one. Returns `-1` if the array or subsection is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array<Real>` | The array to search. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to search. Negative values count backwards from the offset. Defaults to the full array length. |

**Returns:** `Real`

---

## array_index_min

[source](../../LiftKit/__LKArray/__LKArray.gml#L365)

```gml
array_index_min(array, offset, length)
```

Returns the index of the lowest value in an array or subsection of one. Returns `-1` if the array or subsection is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array<Real>` | The array to search. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to search. Negative values count backwards from the offset. Defaults to the full array length. |

**Returns:** `Real`

---

## array_insert_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L188)

```gml
array_insert_ext(dest, index, source, offset, length)
```

Inserts elements from one array into another at a specified index.

| Parameter | Type | Description |
|-----------|------|-------------|
| `dest` | `Array` | The destination array. |
| `index` | `Real` | The index in the destination to insert at. Negative values count from the end. |
| `source` | `Array` | The source array to take elements from. |
| `offset` | `Real` | *(optional)* The starting index in the source array. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to insert. Defaults to the full source array length. |

---

## array_max

[source](../../LiftKit/__LKArray/__LKArray.gml#L288)

```gml
array_max(array, offset, length)
```

Returns the highest value in an array or subsection of one. Returns `0` if the array or subsection is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array<Real>` | The array to search. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to search. Negative values count backwards from the offset. Defaults to the full array length. |

**Returns:** `Real`

---

## array_min

[source](../../LiftKit/__LKArray/__LKArray.gml#L326)

```gml
array_min(array, offset, length)
```

Returns the lowest value in an array or subsection of one. Returns `0` if the array or subsection is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array<Real>` | The array to search. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to search. Negative values count backwards from the offset. Defaults to the full array length. |

**Returns:** `Real`

---

## array_partition

[source](../../LiftKit/__LKArray/__LKArray.gml#L891)

```gml
array_partition(array, predicate, offset, length)
```

Splits an array into two based on a predicate function. Returns a two-element array where the first element is an array of all values for which the predicate returned `true`, and the second is all values for which it returned `false`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to partition. |
| `predicate` | `Function` | A function that takes a value and returns `true` or `false`. |
| `offset` | `Real` | *(optional)* The index to start from. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to partition. Defaults to the full array length. |

**Returns:** `Array<Array>`

```gml
var result = array_partition(enemies, function(e) { return e.hp > 0; });
var alive = result[0];
var dead  = result[1];
```

---

## array_pop_random

[source](../../LiftKit/__LKArray/__LKArray.gml#L100)

```gml
array_pop_random(array, offset, length)
```

Removes and returns a random element from the array or a subsection of it. Modifies the original array. Returns `undefined` if the array or subsection is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to pop from. |
| `offset` | `Real` | *(optional)* The starting index. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to pick from. Negative values count backwards from the offset. Defaults to the full array length. |

**Returns:** `Any | Undefined`

---

## array_push_cull

[source](../../LiftKit/__LKArray/__LKArray.gml#L229)

```gml
array_push_cull(array, limit, ...)
```

Pushes any number of values onto the end of an array, then removes the oldest (first) elements until it is at or below the limit. Unlike `array_push_limit`, this always accepts the new values and culls old ones to make room rather than refusing to push when full.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to push to. |
| `limit` | `Real` | The maximum number of elements to keep after pushing. |
| `...` | `Any \| Array` | One or more values or arrays of values to push. |

---

## array_push_ext

[source](../../LiftKit/__LKArray/__LKArray.gml#L166)

```gml
array_push_ext(dest, source, offset, length)
```

Pushes elements from one array onto the end of another.

| Parameter | Type | Description |
|-----------|------|-------------|
| `dest` | `Array` | The destination array to push elements onto. |
| `source` | `Array` | The source array to take elements from. |
| `offset` | `Real` | *(optional)* The starting index in the source array. Negative values count from the end. Defaults to `0`. |
| `length` | `Real` | *(optional)* The number of elements to push. Defaults to the full source array length. |

---

## array_push_limit

[source](../../LiftKit/__LKArray/__LKArray.gml#L261)

```gml
array_push_limit(array, limit, ...)
```

Pushes any number of values onto the end of the given array, but only up to the given limit. Once the array is full, further values are silently discarded. Modifies the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to push to. |
| `limit` | `Real` | The maximum number of elements to allow. |
| `...` | `Any \| Array` | One or more values or arrays of values to push. |

---

## array_sample

[source](../../LiftKit/__LKArray/__LKArray.gml#L785)

```gml
array_sample(array, n, replace)
```

Returns an array of `n` randomly selected elements from the source array. By default, sampling is done without replacement -- the same element can't be picked twice. Set `replace` to `true` to allow repeated picks. The default for `replace` is configurable in [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to sample from. |
| `n` | `Real` | The number of elements to sample. |
| `replace` | `Bool` | *(optional)* Whether to allow the same element to be picked more than once. Defaults to `false`. |

**Returns:** `Array`

```gml
// Pick 3 random items from a loot table, no duplicates
var drops = array_sample(loot_table, 3);
```

---

## array_unzip

[source](../../LiftKit/__LKArray/__LKArray.gml#L755)

```gml
array_unzip(array)
```

Splits an array of sub-arrays into an array of arrays, one per column. The inverse of `array_zip`. Each sub-array must be the same length.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array<Array>` | The zipped array to unzip. |

**Returns:** `Array<Array>`

---

## array_zip

[source](../../LiftKit/__LKArray/__LKArray.gml#L716)

```gml
array_zip(fill, ...)
```

Combines any number of arrays into a single array of sub-arrays, where each sub-array contains the elements at the same index from each input array. If arrays are of unequal length, missing values are filled with `fill`. Use `undefined` as the fill value if no specific fill is needed.

| Parameter | Type | Description |
|-----------|------|-------------|
| `fill` | `Any` | The value to fill missing elements with. Use `undefined` if not needed. |
| `...` | `Array` | Two or more arrays to zip together. |

**Returns:** `Array<Array> | Undefined`

```gml
var zipped = array_zip(0, [1,2,3], [4,5], [6,7,8,9]);
// [[1,4,6], [2,5,7], [3,0,8], [0,0,9]]
```
