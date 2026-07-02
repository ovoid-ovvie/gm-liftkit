# File

---

## file_copy_safe

[source](../LiftKit/__LKFile/__LKFile.gml#L4)

```gml
file_copy_safe(fname, newname)
```

Copies a file to a new name, but only if the source file exists and no file with the new name already exists. Does nothing if either condition is not met.

| Parameter | Type | Description |
|-----------|------|-------------|
| `fname` | `String` | The path of the file to copy. |
| `newname` | `String` | The path of the new copied file. |

---

## file_text_read_all

[source](../LiftKit/__LKFile/__LKFile.gml#L15)

```gml
file_text_read_all(filename)
```

Returns the entire contents of a file as a string. Returns `undefined` if the file could not be read, and `""` if the file is empty.

| Parameter | Type | Description |
|-----------|------|-------------|
| `filename` | `String` | The path of the file to read. |

**Returns:** `String | Undefined`

---

## file_text_write_all

[source](../LiftKit/__LKFile/__LKFile.gml#L38)

```gml
file_text_write_all(filename, content)
```

Creates or overwrites a file with the given string content.

| Parameter | Type | Description |
|-----------|------|-------------|
| `filename` | `String` | The path of the file to write. |
| `content` | `String` | The content to write to the file. |

---

## ini_read_bool

[source](../LiftKit/__LKFile/__LKFile.gml#L52)

```gml
ini_read_bool(section, key, _default, use_string)
```

Reads a boolean value from an open `.ini` file. Supports storing booleans as either reals (`0`/`1`) or strings (`"true"`/`"false"`).

| Parameter | Type | Description |
|-----------|------|-------------|
| `section` | `String` | The section of the `.ini` to read from. |
| `key` | `String` | The key to read. |
| `_default` | `Bool \| Real` | The value to return if the key cannot be read. |
| `use_string` | `Bool` | *(optional)* If `true`, reads as a string. If `false`, reads as a real. Defaults to `false`. |

**Returns:** `Bool`

---

## ini_write_bool

[source](../LiftKit/__LKFile/__LKFile.gml#L72)

```gml
ini_write_bool(section, key, input_value, use_string)
```

Writes a boolean value to an open `.ini` file. Supports storing booleans as either reals (`0`/`1`) or strings (`"true"`/`"false"`).

| Parameter | Type | Description |
|-----------|------|-------------|
| `section` | `String` | The section of the `.ini` to write to. |
| `key` | `String` | The key to write to. |
| `input_value` | `Bool \| Real` | The value to write. |
| `use_string` | `Bool` | *(optional)* If `true`, writes as a string. If `false`, writes as a real. Defaults to `false`. |

---

## json_load

[source](../LiftKit/__LKFile/__LKFile.gml#L92)

```gml
json_load(filename, filter, raw)
```

Loads and parses a JSON file into a GML value. Returns `undefined` if the file cannot be read or if the content is not valid JSON.

| Parameter | Type | Description |
|-----------|------|-------------|
| `filename` | `String` | The path of the JSON file to load. |
| `filter` | `Function` | *(optional)* A filter function for fine-grained control over parsing. Defaults to `undefined`. |
| `raw` | `Bool` | *(optional)* If `true`, special strings are treated as regular strings. Defaults to `false`. |

**Returns:** `Any | Undefined`

---

## json_save

[source](../LiftKit/__LKFile/__LKFile.gml#L116)

```gml
json_save(filename, value, prettify, filter)
```

Serialises a GML value and saves it to a JSON file.

| Parameter | Type | Description |
|-----------|------|-------------|
| `filename` | `String` | The path of the JSON file to save. |
| `value` | `Any` | The value to save. |
| `prettify` | `Bool` | *(optional)* Whether to include indentation and newlines for readability. Configurable via [`__LKConfig`](LKConfig.md). Defaults to `false`. |
| `filter` | `Function` | *(optional)* A filter function for fine-grained control over formatting. Defaults to `undefined`. |

---

## file_obfuscate

[source](../LiftKit/__LKFile/__LKFile.gml#L125)

```gml
file_obfuscate(filename, key)
```

Obfuscates or unobfuscates a file. Obfuscated files will be unobfuscated, and unobfuscated files will be obfuscated. Does nothing if no file with the given name exists. Note that this is not encryption and is not suitable for security-based applications, only protecting against casual attempts.

| Parameter | Type | Description |
|-----------|------|-------------|
| `filename` | `String` | The name of the file to process. |
| `key` | `Real` | A number from `0`-`255` that acts as a key. To unobfuscate a file, the key must match the one used to obfuscate it. |

```gml
// Obfuscate
file_obfuscate("save1.dat", 137);

// Later, unobfuscate with the same key
file_obfuscate("save1.dat", 137);
```
