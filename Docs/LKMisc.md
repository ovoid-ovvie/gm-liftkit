# Misc

---

## frame

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L53)

```gml
frame(_frame)
```

Returns `true` if the calling instance's current animation frame matches the target frame number. Useful for triggering logic at a specific point in an animation.

Must be called from an instance context as it uses `image_index`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `_frame` | `Real` | The frame number to check against. |

**Returns:** `Bool`

```gml
// Trigger a sound on frame 3 of an attack animation
if ( frame(3) )
{
    audio_play_sound(snd_swing, 1, false);
}
```

---

## is_defined

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L5)

```gml
is_defined(n)
```

Returns `true` if `n` is not nullish (neither `undefined` nor `pointer_null`), or `false` if it is.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Any` | The value to check. |

**Returns:** `Bool`

---

## is_nullish

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L14)

```gml
is_nullish(n)
```

Returns `true` if `n` is nullish (`undefined` or `pointer_null`), or `false` if it is not.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Any` | The value to check. |

**Returns:** `Bool`

---

## surface_verify

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L62)

```gml
surface_verify(surface, width, height)
```

Checks whether a surface exists and has the correct dimensions. If it doesn't exist or its dimensions don't match, it is recreated. Returns the valid surface. Use this at the start of a draw event to ensure a surface is always valid before drawing to it.

| Parameter | Type | Description |
|-----------|------|-------------|
| `surface` | `Id.Surface` | The surface to verify. |
| `width` | `Real` | The required width of the surface. |
| `height` | `Real` | The required height of the surface. |

**Returns:** `Id.Surface`

```gml
// Create event
surf = surface_create(256, 256);

// Draw event
surf = surface_verify(surf, 256, 256);
surface_set_target(surf);
// ... draw to surface ...
surface_reset_target();
```

---

## debug_trace

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L77)

```gml
debug_trace(...)
```

Creates a debug message from any number of values and prints it to the debug console, with the call stack appended.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Any` | One or more values to print. |

```gml
debug_trace("hp:", hp, "max:", max_hp);
// outputs:
// hp:45max:100
// Callstack:
//   ...
```

---

## debug_assert

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L96)

```gml
debug_assert(...)
```

Creates a debug message from any number of values and prints it to the debug console, with the call stack appended. Throws a fatal error instead if the build is running in the IDE.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Any` | One or more values to print. |

```gml
if ( !is_struct(data) )
{
    debug_assert("Expected a struct but got:", data);
}
```

---

## exception_concat

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L123)

```gml
exception_concat(exception)
```

Takes an exception as input and creates a single string combining its `message`, `longMessage`, `script`, and `stacktrace` fields with newlines in between.

| Parameter | Type | Description |
|-----------|------|-------------|
| `exception` | `Struct` | The exception to combine. |

**Returns:** `String`

```gml
try
{
    risky_operation();
}
catch (_exception)
{
    debug_trace(exception_concat(_exception));
}
```

---

## unique

[source](../../LiftKit/__LKMisc/__LKMisc.gml#L23)

```gml
unique(...)
```

Returns an array of all unique values from the supplied arguments, preserving order of first occurrence. Accepts any combination of individual values and arrays.

| Parameter | Type | Description |
|-----------|------|-------------|
| `...` | `Any \| Array` | One or more values or arrays of values. |

**Returns:** `Array`

```gml
var result = unique(1, 2, 1, [3, 2, 4]);
// [1, 2, 3, 4]
```
