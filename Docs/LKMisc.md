# Misc

---

## frame -- [source](LiftKit/LKMisc/LKMisc.gml#L53)

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

## is_defined -- [source](LiftKit/LKMisc/LKMisc.gml#L5)

```gml
is_defined(n)
```

Returns `true` if `n` is not nullish (neither `undefined` nor `pointer_null`), or `false` if it is.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Any` | The value to check. |

**Returns:** `Bool`

---

## is_nullish -- [source](LiftKit/LKMisc/LKMisc.gml#L14)

```gml
is_nullish(n)
```

Returns `true` if `n` is nullish (`undefined` or `pointer_null`), or `false` if it is not.

| Parameter | Type | Description |
|-----------|------|-------------|
| `n` | `Any` | The value to check. |

**Returns:** `Bool`

---

## unique -- [source](LiftKit/LKMisc/LKMisc.gml#L23)

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
