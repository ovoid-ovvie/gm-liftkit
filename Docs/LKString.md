# String

String utilities including a full case-insensitive counterpart family for GML's native string search functions, and a set of string distance functions for fuzzy matching.

---

## bool_stringify

[source](../LiftKit/__LKString/__LKString.gml#L7)

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

## string_contains

[source](../LiftKit/__LKString/__LKString.gml#L32)

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

## string_count_nocase

[source](../LiftKit/__LKString/__LKString.gml#L51)

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

## string_equals_nocase

[source](../LiftKit/__LKString/__LKString.gml#L63)

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

## string_last_pos_nocase

[source](../LiftKit/__LKString/__LKString.gml#L166)

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

## string_last_pos_ext_nocase

[source](../LiftKit/__LKString/__LKString.gml#L179)

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

## string_pad_full

[source](../LiftKit/__LKString/__LKString.gml#L102)

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
string_pad_full("hi", 8, "-")             // "---hi---"
string_pad_full("hi", 8, "-", false)      // "---hi---" (bias right: extra goes right)
string_pad_full("hi", 8, "-", true, " ")  // "-- hi --"
```

---

## string_pad_left

[source](../LiftKit/__LKString/__LKString.gml#L74)

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

## string_pad_right

[source](../LiftKit/__LKString/__LKString.gml#L87)

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

## string_pos_all

[source](../LiftKit/__LKString/__LKString.gml#L192)

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

## string_pos_all_nocase

[source](../LiftKit/__LKString/__LKString.gml#L214)

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

## string_pos_nocase

[source](../LiftKit/__LKString/__LKString.gml#L141)

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

## string_pos_ext_nocase

[source](../LiftKit/__LKString/__LKString.gml#L154)

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

## string_reflow

[source](../LiftKit/__LKString/__LKString.gml#L466)

```gml
string_reflow(str, first_line_width, subsequent_line_width)
```

Splits a string into an array of lines such that each line fits within a given pixel width, measured using `string_width`. Uses a binary search to find break points efficiently. The first line and subsequent lines can have different widths, which is useful for indented or hanging text layouts.

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to wrap. |
| `first_line_width` | `Real` | The maximum pixel width of the first line. |
| `subsequent_line_width` | `Real` | The maximum pixel width of all lines after the first. |

**Returns:** `Array<String>`

```gml
// Draw Event
var lines = string_reflow(dialogue_text, 320, 320);
for (var i = 0; i < array_length(lines); i++)
{
    draw_text(x, y + i * 20, lines[i]);
}
```

---

## string_reverse

[source](../LiftKit/__LKString/__LKString.gml#L236)

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

## string_sanitise / string_sanitize

[source](../LiftKit/__LKString/__LKString.gml#L258) / [source](../LiftKit/__LKString/__LKString.gml#L296)

```gml
string_sanitise(str, fill, remove_slashes, remove_quotes, exceptions)
string_sanitize(str, fill, remove_slashes, remove_quotes, exceptions)
```

Removes or replaces characters from a string that are commonly unsafe for file names, paths, or user input. All optional parameters are configurable via [`__LKConfig`](LKConfig.md). `string_sanitize` is an alias with American spelling.

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to sanitise. |
| `fill` | `String` | *(optional)* The string to replace each removed character with. Defaults to `""`. |
| `remove_slashes` | `Bool` | *(optional)* Whether to also remove forward and back slashes. Defaults to `false`. |
| `remove_quotes` | `Bool` | *(optional)* Whether to also remove quote characters. Defaults to `false`. |
| `exceptions` | `Array<String>` | *(optional)* Characters that should be kept even if they would otherwise be removed. Defaults to `[]`. |

**Returns:** `String`

---

## string_truncate

[source](../LiftKit/__LKString/__LKString.gml#L518)

```gml
string_truncate(str, max_len, suffix)
```

Truncates a string to a maximum character length, appending a suffix (by default `"..."`) if the string was cut. The default suffix is configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to truncate. |
| `max_len` | `Real` | The maximum character length. |
| `suffix` | `String` | *(optional)* The string to append when truncated. Defaults to `"..."`. |

**Returns:** `String`

```gml
string_truncate("Hello world", 8)   // "Hello..."
```

---

## stringdist_lev

[source](../LiftKit/__LKString/__LKString.gml#L313)

```gml
stringdist_lev(a, b)
```

Returns the Levenshtein distance between two strings -- the minimum number of single-character insertions, deletions, or substitutions required to transform `a` into `b`. Lower values mean the strings are more similar; `0` means they are identical.

| Parameter | Type | Description |
|-----------|------|-------------|
| `a` | `String` | The first string to compare. |
| `b` | `String` | The second string to compare. |

**Returns:** `Real`

```gml
stringdist_lev("kitten", "sitting")   // 3
stringdist_lev("hello", "hello")      // 0
```

---

## stringdist_osa

[source](../LiftKit/__LKString/__LKString.gml#L344)

```gml
stringdist_osa(a, b)
```

Returns the Optimal String Alignment distance between two strings. Similar to Levenshtein but also counts transpositions (swapping two adjacent characters) as a single operation, making it better suited for catching common typos. Used as the default distance method for `stringdist_find_closest` and `stringdist_find_closest_multi`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `a` | `String` | The first string to compare. |
| `b` | `String` | The second string to compare. |

**Returns:** `Real`

---

## stringdist_find_closest

[source](../LiftKit/__LKString/__LKString.gml#L382)

```gml
stringdist_find_closest(str, threshold, targets)
```

Finds the closest match to `str` from an array of target strings using OSA distance. Returns the closest match if it is within the threshold distance, or an empty string if no candidate is close enough. The default threshold is configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to find a match for. |
| `threshold` | `Real` | *(optional)* The maximum distance to accept as a match. Defaults to `2`. |
| `targets` | `Array<String>` | The array of strings to search through. |

**Returns:** `String`

```gml
var commands = ["help", "quit", "load", "save"];
var match = stringdist_find_closest(user_input, 2, commands);
if ( match != "" )
{
    show_message("Did you mean: " + match + "?");
}
```

---

## stringdist_find_closest_multi

[source](../LiftKit/__LKString/__LKString.gml#L409)

```gml
stringdist_find_closest_multi(str, threshold, ...)
```

Finds the closest match to `str` from any number of target strings or arrays of strings using OSA distance. Arguments may be individual strings or arrays of strings. Returns the closest match if it is within the threshold distance, or an empty string if no candidate is close enough. The default threshold is configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `str` | `String` | The string to find a match for. |
| `threshold` | `Real` | *(optional)* The maximum distance to accept as a match. Defaults to `2`. |
| `...` | `String \| Array<String>` | One or more strings or arrays of strings to search through. |

**Returns:** `String`

```gml
stringdist_find_closest_multi(user_input, 2, "help", "quit", ["load", "save"]);
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
