# Camera

---

## point_in_view -- [source](../../LiftKit/scripts/LKCamera/LKCamera.gml#L6)

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
