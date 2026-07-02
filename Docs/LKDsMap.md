# DS Map

Utilities for working with DS Maps alongside structs.

---

## ds_map_to_struct

[source](../LiftKit/__LKDsMap/__LKDsMap.gml#L6)

```gml
ds_map_to_struct(map)
```

Converts a DS Map to a struct and returns it. The DS Map is not destroyed.

| Parameter | Type | Description |
|-----------|------|-------------|
| `map` | `Id.DsMap` | The DS Map to convert. |

**Returns:** `Struct`

```gml
var s = ds_map_to_struct(my_map);
show_debug_message(s.some_key);
```

---

## ds_map_create_from_struct

[source](../LiftKit/__LKDsMap/__LKDsMap.gml#L25)

```gml
ds_map_create_from_struct(struct)
```

Converts a struct to a new DS Map and returns it. The caller is responsible for destroying the returned DS Map when it is no longer needed.

| Parameter | Type | Description |
|-----------|------|-------------|
| `struct` | `Struct` | The struct to convert. |

**Returns:** `Id.DsMap`

```gml
var map = ds_map_create_from_struct(my_struct);
// ... use map ...
ds_map_destroy(map);
```
