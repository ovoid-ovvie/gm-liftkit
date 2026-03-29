# String

String utilities including a full case-insensitive counterpart family for GML's native string search functions.

---

## bool_stringify -- [source](../../LiftKit/LKString/LKString.gml#L7)

```gml
bool_stringify(b, true_label, false_label)
```

Returns a string representation of a boolean value. The default labels are configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `b` | `Bool` | The boolean value to stringify. |
| `true_label` | `String` | *(optional)* The string to return if `b` is `true`. Defaults to `"true"`. |
| `false_label` | `String` | *(optional)* The string to return if `b` is `false`. Defaults to `"false"`. |

**Returns:** `String`

```gml
bool_stringify(fullscreen)               // "true" or "false"
bool_stringify(fullscreen, "On", "Off")  // "On" or "Off"
bool_stringify(fullscreen, "Yes", "No")  // "Yes" or "No"
```

---

## string_contains -- [source](../../LiftKit/LKString/LKString.gml#L32)

```gml
string_contains(substr, str, case_sensitive)
```

Returns `true` if `str` contains `substr`. Case sensitive by default. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |
| `case_sensitive` | `Bool` | *(optional)* Whether to match case sensitively. Defaults to `true`. |

**Returns:** `Bool`

---

## string_count_nocase -- [source](../../LiftKit/LKString/LKString.gml#L51)

```gml
string_count_nocase(substr, str)
```

Returns the number of occurrences of `substr` within `str`, case insensitively.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to count. |
| `str` | `String` | The string to search within. |

**Returns:** `Real`

---

## string_equals_nocase -- [source](../../LiftKit/LKString/LKString.gml#L63)

```gml
string_equals_nocase(str1, str2)
```

Returns `true` if `str1` and `str2` are equal, ignoring case.

| Parameter | Type | Description |
|-----------|------|-------------|
| `str1` | `String` | The first string to compare. |
| `str2` | `String` | The second string to compare. |

**Returns:** `Bool`

---

## string_last_pos_nocase -- [source](../../LiftKit/LKString/LKString.gml#L166)

```gml
string_last_pos_nocase(substr, str)
```

Returns the position of the last occurrence of `substr` within `str`, case insensitively. Returns `0` if not found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |

**Returns:** `Real`

---

## string_last_pos_ext_nocase -- [source](../../LiftKit/LKString/LKString.gml#L179)

```gml
string_last_pos_ext_nocase(substr, str, start_pos)
```

Returns the position of the last occurrence of `substr` within `str` at or before `start_pos`, case insensitively. Returns `0` if not found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |
| `start_pos` | `Real` | The position to start searching backwards from. |

**Returns:** `Real`

---

## string_pad_full -- [source](../../LiftKit/LKString/LKString.gml#L102)

```gml
string_pad_full(str, _len, char, bias_left, separator, force_separator)
```

Pads `str` on both sides with `char` until it reaches the target length. When padding is uneven, the extra character goes to the left side by default. Configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to pad. |
| `_len` | `Real` | The target length to pad to. |
| `char` | `String` | The character to pad with. |
| `bias_left` | `Bool` | *(optional)* When padding is uneven, give the extra character to the left (`true`) or right (`false`). Defaults to `true`. |
| `separator` | `String` | *(optional)* A character placed between the string and the padding on each side. Defaults to `undefined` (no separator). |
| `force_separator` | `Bool` | *(optional)* If `true`, includes the separator even if there is no room for padding. Defaults to `false`. |

**Returns:** `String`

```gml
string_pad_full("hi", 8, "-")          // "---hi---"
string_pad_full("hi", 8, "-", false)   // "---hi---" (bias right: extra goes right)
string_pad_full("hi", 8, "-", true, " ")  // "-- hi --"
```

---

## string_pad_left -- [source](../../LiftKit/LKString/LKString.gml#L74)

```gml
string_pad_left(str, _len, char)
```

Pads `str` on the left with `char` until it reaches the target length. Returns `str` unchanged if it is already at or above the target length.

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to pad. |
| `_len` | `Real` | The target length to pad to. |
| `char` | `String` | The character to pad with. |

**Returns:** `String`

```gml
string_pad_left("42", 5, "0")   // "00042"
string_pad_left("42", 5, " ")   // "   42"
```

---

## string_pad_right -- [source](../../LiftKit/LKString/LKString.gml#L87)

```gml
string_pad_right(str, _len, char)
```

Pads `str` on the right with `char` until it reaches the target length. Returns `str` unchanged if it is already at or above the target length.

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to pad. |
| `_len` | `Real` | The target length to pad to. |
| `char` | `String` | The character to pad with. |

**Returns:** `String`

---

## string_pos_all -- [source](../../LiftKit/LKString/LKString.gml#L192)

```gml
string_pos_all(substr, str, start_pos)
```

Returns an array of positions of every occurrence of `substr` within `str`. Returns an empty array if `substr` is not found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |
| `start_pos` | `Real` | *(optional)* The position to start searching from. Defaults to `1`. |

**Returns:** `Array<Real>`

```gml
string_pos_all("a", "banana")   // [2, 4, 6]
```

---

## string_pos_all_nocase -- [source](../../LiftKit/LKString/LKString.gml#L214)

```gml
string_pos_all_nocase(substr, str, start_pos)
```

Returns an array of positions of every occurrence of `substr` within `str`, case insensitively. Returns an empty array if `substr` is not found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |
| `start_pos` | `Real` | *(optional)* The position to start searching from. Defaults to `1`. |

**Returns:** `Array<Real>`

---

## string_pos_nocase -- [source](../../LiftKit/LKString/LKString.gml#L141)

```gml
string_pos_nocase(substr, str)
```

Returns the position of the first occurrence of `substr` within `str`, case insensitively. Returns `0` if not found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |

**Returns:** `Real`

---

## string_pos_ext_nocase -- [source](../../LiftKit/LKString/LKString.gml#L154)

```gml
string_pos_ext_nocase(substr, str, start_pos)
```

Returns the position of the first occurrence of `substr` within `str` at or after `start_pos`, case insensitively. Returns `0` if not found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `substr` | `String` | The substring to search for. |
| `str` | `String` | The string to search within. |
| `start_pos` | `Real` | The position to start searching from. |

**Returns:** `Real`

---

## string_reverse -- [source](../../LiftKit/LKString/LKString.gml#L236)

```gml
string_reverse(str)
```

Returns `str` with its characters in reverse order.

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to reverse. |

**Returns:** `String`

```gml
string_reverse("hello")   // "olleh"
```

---

## Case-Insensitive Function Reference

GMLiftKit provides case-insensitive counterparts for all of GML's string search functions:

| GML Native | GMLiftKit Equivalent |
|------------|----------------------|
| `string_pos` | `string_pos_nocase` |
| `string_pos_ext` | `string_pos_ext_nocase` |
| `string_last_pos` | `string_last_pos_nocase` |
| `string_last_pos_ext` | `string_last_pos_ext_nocase` |
| `string_count` | `string_count_nocase` |
| *(no native equivalent)* | `string_pos_all` |
| *(no native equivalent)* | `string_pos_all_nocase` |
| *(no native equivalent)* | `string_equals_nocase` |
