# Camera

---

## camera_get_centre / camera_get_center

[source](../../LiftKit/__LKCamera/__LKCamera.gml#L5) / [source](../../LiftKit/__LKCamera/__LKCamera.gml#L18)

```gml
camera_get_centre(cam_id)
camera_get_center(cam_id)
```

Returns the centre point of a camera's view as a struct with `x` and `y` fields. `camera_get_center` is an alias with American spelling.

| Parameter | Type | Description |
|-----------|------|-------------|
| `cam_id` | `Id.Camera` | The camera to get the centre of. |

**Returns:** `Struct { x: Real, y: Real }`

```gml
var centre = camera_get_centre(camera_get_active());
draw_circle(centre.x, centre.y, 8, false);
```

---

## point_in_view

[source](../../LiftKit/__LKCamera/__LKCamera.gml#L28)

```gml
point_in_view(px, py, cam_id)
```

Returns `true` if the given point falls within the bounds of the specified camera's view.

| Parameter | Type | Description |
|-----------|------|-------------|
| `px` | `Real` | The x coordinate of the point. |
| `py` | `Real` | The y coordinate of the point. |
| `cam_id` | `Id.Camera` | The camera to check against. |

**Returns:** `Bool`

```gml
if ( point_in_view(enemy.x, enemy.y, camera_get_active()) )
{
    // enemy is visible, run AI
}
```

---

## rect_in_view

[source](../../LiftKit/__LKCamera/__LKCamera.gml#L49)

```gml
rect_in_view(x1, y1, x2, y2, cam_id)
```

Returns `true` if any part of the given rectangle overlaps with the specified camera's view. Useful for culling draw calls on large objects where a single point check isn't sufficient.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x1` | `Real` | The x coordinate of the rectangle's left side. |
| `y1` | `Real` | The y coordinate of the rectangle's top side. |
| `x2` | `Real` | The x coordinate of the rectangle's right side. |
| `y2` | `Real` | The y coordinate of the rectangle's bottom side. |
| `cam_id` | `Id.Camera` | The camera to check against. |

**Returns:** `Bool`
