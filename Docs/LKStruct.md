# Struct

---

## struct_contains_value

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L89)

```gml
struct_contains_value(struct, value)
```

Returns `true` if any value in the struct is equal to `value`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to search. |
| `value` | `Any` | The value to search for. |

**Returns:** `Bool`

---

## struct_filter

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L127)

```gml
struct_filter(struct, predicate)
```

Returns a new struct containing only the key-value pairs for which the predicate function returns `true`. The predicate receives both the key and value as arguments.

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to filter. |
| `predicate` | `Function` | A function that takes `(key, value)` and returns `true` or `false`. |

**Returns:** `Struct`

```gml
// Keep only numeric values
var nums = struct_filter(my_struct, function(key, val) { return is_numeric(val); });
```

---

## struct_find

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L108)

```gml
struct_find(struct, value)
```

Returns the key name of the first entry whose value equals `value`. Returns an empty string if no match is found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to search. |
| `value` | `Any` | The value to search for. |

**Returns:** `String`

```gml
var key = struct_find(my_struct, 42);
if ( key != "" )
{
    show_debug_message("Found at key: " + key);
}
```

---

## struct_map

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L149)

```gml
struct_map(struct, transform)
```

Returns a new struct with the same keys as the input but with each value replaced by the result of passing the key and value through the transform function.

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to transform. |
| `transform` | `Function` | A function that takes `(key, value)` and returns the new value. |

**Returns:** `Struct`

```gml
// Double all values in a stats struct
var doubled = struct_map(stats, function(key, val) { return val * 2; });
```

---

## struct_merge

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L33)

```gml
struct_merge(...)
```

Merges any number of structs into a single new struct. In the case of duplicate keys, the value from the earliest supplied struct is used. Returns `undefined` if no arguments are supplied or if a non-struct argument is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Struct` | One or more structs to merge. |

**Returns:** `Struct | Undefined`

```gml
var defaults = { volume: 1.0, fullscreen: false, lang: "en" };
var user_config = json_load("config.json");
var config = struct_merge(user_config, defaults);
// user values take priority; defaults fill in any missing keys
```

---

## struct_merge_deep

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L58)

```gml
struct_merge_deep(...)
```

Like `struct_merge`, but recursively merges nested structs rather than treating them as opaque values. In the case of duplicate keys, the value from the earliest supplied struct is used at every level of nesting. Returns `undefined` if no arguments are supplied or if a non-struct argument is encountered.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Struct` | One or more structs to deep merge. |

**Returns:** `Struct | Undefined`

```gml
var defaults = { audio: { music: 1.0, sfx: 1.0 }, display: { fullscreen: false } };
var user_cfg  = { audio: { music: 0.5 } };
var config = struct_merge_deep(user_cfg, defaults);
// config.audio.music           == 0.5   (from user_cfg)
// config.audio.sfx             == 1.0   (from defaults)
// config.display.fullscreen    == false (from defaults)
```

---

## variable_struct_get_names_alphabetical

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L6)

```gml
variable_struct_get_names_alphabetical(struct, ascending)
```

Returns an array of all key names in a struct sorted alphabetically. The default sort order is configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to get the key names of. |
| `ascending` | `Bool` | *(optional)* If `true`, sorts A-Z. If `false`, sorts Z-A. Defaults to `true`. |

**Returns:** `Array<String>`

---

## variable_struct_get_values

[source](../../LiftKit/__LKStruct/__LKStruct.gml#L17)

```gml
variable_struct_get_values(struct)
```

Returns an array of all values in a struct. The counterpart to GML's native `variable_struct_get_names`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to get the values of. |

**Returns:** `Array`

```gml
var keys   = variable_struct_get_names(my_struct);
var values = variable_struct_get_values(my_struct);
```
