# Struct

---

## struct_merge -- [source](../../LiftKit/scripts/LKStruct/LKStruct.gml#L20)

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

## variable_struct_get_values -- [source](../../LiftKit/scripts/LKStruct/LKStruct.gml#L5)

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
