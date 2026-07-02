# DS List

Utilities for working with DS Lists alongside arrays.

---

## ds_list_add_from_array

[source](../../LiftKit/__LKDsList/__LKDsList.gml#L25)

```gml
ds_list_add_from_array(list, array)
```

Adds all elements from an array to an existing DS List.

| Parameter | Type | Description |
|-----------|------|-------------|
| `list` | `Id.DsList` | The list to add items to. |
| `array` | `Array` | The array to get items from. |

---

## ds_list_add_to_array

[source](../../LiftKit/__LKDsList/__LKDsList.gml#L47)

```gml
ds_list_add_to_array(list, array)
```

Adds all elements from a DS List to an existing array.

| Parameter | Type | Description |
|-----------|------|-------------|
| `list` | `Id.DsList` | The list to get items from. |
| `array` | `Array` | The array to add items to. |

---

## ds_list_create_from_array

[source](../../LiftKit/__LKDsList/__LKDsList.gml#L37)

```gml
ds_list_create_from_array(array)
```

Creates a new DS List populated with the contents of an array and returns it. The caller is responsible for destroying the returned DS List when it is no longer needed.

| Parameter | Type | Description |
|-----------|------|-------------|
| `array` | `Array` | The array to get items from. |

**Returns:** `Id.DsList`

```gml
var list = ds_list_create_from_array(my_array);
// ... use list ...
ds_list_destroy(list);
```

---

## ds_list_to_array

[source](../../LiftKit/__LKDsList/__LKDsList.gml#L6)

```gml
ds_list_to_array(list, destroy)
```

Converts a DS List to an array and returns it. Optionally destroys the DS List afterwards.

| Parameter | Type | Description |
|-----------|------|-------------|
| `list` | `Id.DsList` | The DS List to convert. |
| `destroy` | `Bool` | Whether to destroy the DS List after converting. |

**Returns:** `Array`

```gml
// Convert and keep the list
var arr = ds_list_to_array(my_list, false);

// Convert and destroy the list
var arr = ds_list_to_array(my_list, true);
```
