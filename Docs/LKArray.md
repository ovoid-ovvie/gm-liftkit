# Array

Array utilities with subsection support, equalisation, zip/unzip, and more.

---

## array_chunk -- [source](../../LiftKit/LKArray/LKArray.gml#L14)

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

## array_cull -- [source](../../LiftKit/LKArray/LKArray.gml#L120)

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

## array_empty -- [source](../../LiftKit/LKArray/LKArray.gml#L5)

```gml
array_empty(array)
```

Returns `true` if the array has no elements, or `false` if it contains at least one.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to check. |

**Returns:** `Bool`

---

## array_equalise_to_max -- [source](../../LiftKit/LKArray/LKArray.gml#L310)

```gml
array_equalise_to_max(arr)
```

Returns a new array with all values set to the highest value in the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |

**Returns:** `Array<Real>`

---

## array_equalise_to_max_budget -- [source](../../LiftKit/LKArray/LKArray.gml#L330)

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

## array_equalise_to_min -- [source](../../LiftKit/LKArray/LKArray.gml#L362)

```gml
array_equalise_to_min(arr)
```

Returns a new array with all values set to the lowest value in the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `arr` | `Array<Real>` | The array to equalise. |

**Returns:** `Array<Real>`

---

## array_equalise_to_min_budget -- [source](../../LiftKit/LKArray/LKArray.gml#L382)

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

## array_flatten -- [source](../../LiftKit/LKArray/LKArray.gml#L31)

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

## array_get_random -- [source](../../LiftKit/LKArray/LKArray.gml#L57)

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

## array_insert_ext -- [source](../../LiftKit/LKArray/LKArray.gml#L163)

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

## array_max -- [source](../../LiftKit/LKArray/LKArray.gml#L235)

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

## array_min -- [source](../../LiftKit/LKArray/LKArray.gml#L273)

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

## array_pop_random -- [source](../../LiftKit/LKArray/LKArray.gml#L88)

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

## array_push_ext -- [source](../../LiftKit/LKArray/LKArray.gml#L141)

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

## array_push_limit -- [source](../../LiftKit/LKArray/LKArray.gml#L205)

```gml
array_push_limit(array, limit, ...)
```

Pushes any number of values or arrays of values onto the end of the given array, then removes the oldest (first) elements until the array is at or below the limit. Modifies the original array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to push to. |
| `limit` | `Real` | The maximum number of elements to keep. |
| `...` | `Any \| Array` | One or more values or arrays of values to push. |

---

## array_unzip -- [source](../../LiftKit/LKArray/LKArray.gml#L448)

```gml
array_unzip(array)
```

Splits an array of sub-arrays into an array of arrays, one per column. The inverse of `array_zip`. Each sub-array must be the same length.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array<Array>` | The zipped array to unzip. |

**Returns:** `Array<Array>`

---

## array_zip -- [source](../../LiftKit/LKArray/LKArray.gml#L415)

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
