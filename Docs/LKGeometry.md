# Geometry

---

## binary_search_distance -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L10)

```gml
binary_search_distance(start_x, start_y, target_x, target_y, obstacle_object, prec, notme, desired_precision)
```

Returns the furthest distance from the start point along the line toward the target point that does not collide with the obstacle. Uses a binary search algorithm for logarithmic performance -- the search range has negligible impact on execution time.

The default precision of `0.24` pixels means the result is within 0.24 pixels of the true collision point. At this precision, searching from one end of the observable universe to the other takes at most 92 iterations.

All optional parameters are configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `start_x` | `Real` | The x coordinate of the start point. |
| `start_y` | `Real` | The y coordinate of the start point. |
| `target_x` | `Real` | The x coordinate of the target point. |
| `target_y` | `Real` | The y coordinate of the target point. |
| `obstacle_object` | `Asset.GMObject \| Constant.All \| Constant.Other \| Array \| Id.TileMapElement` | The obstacle to check against. |
| `prec` | `Bool` | *(optional)* If `true`, uses precise collision masks. If `false`, uses bounding boxes. Defaults to `false`. |
| `notme` | `Bool` | *(optional)* Whether to exclude the calling instance. Defaults to `true`. |
| `desired_precision` | `Real` | *(optional)* The acceptable margin of error in pixels. Defaults to `0.24`. |

**Returns:** `Real`

```gml
// Find how far a bullet can travel before hitting a wall
var dist = binary_search_distance(x, y, target_x, target_y, obj_wall);
var hit_x = x + lengthdir_x(dist, direction);
var hit_y = y + lengthdir_y(dist, direction);
```

---

## find_clear_direction -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L45)

```gml
find_clear_direction(dir, step, obj, max)
```

Starting from `dir`, searches clockwise and counter-clockwise in increments of `step` to find the closest direction that does not collide with `obj`. Returns the signed angle delta from `dir` (negative = counter-clockwise), or `noone` if no clear direction is found within `max` degrees.

Must be called from an instance context as it uses `x`, `y`, and `place_meeting`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `dir` | `Real` | The starting direction in degrees. |
| `step` | `Real` | The angle increment to search in. |
| `obj` | `Asset.GMObject` | The object to check collisions against. |
| `max` | `Real` | *(optional)* The maximum angle to search in either direction. Configurable via [`__LKConfig`](LKConfig.md). Defaults to `90`. |

**Returns:** `Real | Constant.Noone`

```gml
var clear = find_clear_direction(direction, 5, obj_wall);
if ( clear != noone )
{
    direction += clear;
}
```

---

## instance_place_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L129)

```gml
instance_place_array(x, y, obj, array, ordered, replace)
```

Finds all instances colliding with the calling instance's collision mask at the given position and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x coordinate of the checked placement. |
| `y` | `Real` | The y coordinate of the checked placement. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to check. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`

---

## instance_position_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L107)

```gml
instance_position_array(x, y, obj, array, ordered, replace)
```

Finds all instances at the given position and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x coordinate to check. |
| `y` | `Real` | The y coordinate to check. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to find. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`

---

## instance_position_top -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L78)

```gml
instance_position_top(x, y, obj)
```

Returns the instance at the given position with the least depth (i.e. visually on top). Returns `noone` if no instance is found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x coordinate to check. |
| `y` | `Real` | The y coordinate to check. |
| `obj` | `Asset.GMObject \| Constant.All \| Array` | The object(s) to find. |

**Returns:** `Id.Instance`

---

## collision_circle_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L178)

```gml
collision_circle_array(x, y, radius, obj, prec, notme, array, ordered, replace)
```

Finds all instances colliding with a circle and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x coordinate of the circle centre. |
| `y` | `Real` | The y coordinate of the circle centre. |
| `radius` | `Real` | The radius of the circle. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to check. |
| `prec` | `Bool` | Whether to use precise collision masks (`true`) or bounding boxes (`false`). |
| `notme` | `Bool` | Whether to exclude the calling instance. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`

---

## collision_ellipse_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L256)

```gml
collision_ellipse_array(x1, y1, x2, y2, obj, prec, notme, array, ordered, replace)
```

Finds all instances colliding with an ellipse and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x1` | `Real` | The x coordinate of the ellipse's left side. |
| `y1` | `Real` | The y coordinate of the ellipse's top side. |
| `x2` | `Real` | The x coordinate of the ellipse's right side. |
| `y2` | `Real` | The y coordinate of the ellipse's bottom side. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to check. |
| `prec` | `Bool` | Whether to use precise collision masks (`true`) or bounding boxes (`false`). |
| `notme` | `Bool` | Whether to exclude the calling instance. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`

---

## collision_line_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L204)

```gml
collision_line_array(x1, y1, x2, y2, obj, prec, notme, array, ordered, replace)
```

Finds all instances colliding with a line and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x1` | `Real` | The x coordinate of the line start. |
| `y1` | `Real` | The y coordinate of the line start. |
| `x2` | `Real` | The x coordinate of the line end. |
| `y2` | `Real` | The y coordinate of the line end. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to check. |
| `prec` | `Bool` | Whether to use precise collision masks (`true`) or bounding boxes (`false`). |
| `notme` | `Bool` | Whether to exclude the calling instance. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`

---

## collision_point_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L153)

```gml
collision_point_array(x, y, obj, prec, notme, array, ordered, replace)
```

Finds all instances colliding with a point and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x coordinate of the point. |
| `y` | `Real` | The y coordinate of the point. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to check. |
| `prec` | `Bool` | Whether to use precise collision masks (`true`) or bounding boxes (`false`). |
| `notme` | `Bool` | Whether to exclude the calling instance. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`

---

## collision_rectangle_array -- [source](../LiftKit/LKGeometry/LKGeometry.gml#L230)

```gml
collision_rectangle_array(x1, y1, x2, y2, obj, prec, notme, array, ordered, replace)
```

Finds all instances colliding with a rectangle and populates an array with the results. Returns the number of instances found.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x1` | `Real` | The x coordinate of the rectangle's left side. |
| `y1` | `Real` | The y coordinate of the rectangle's top side. |
| `x2` | `Real` | The x coordinate of the rectangle's right side. |
| `y2` | `Real` | The y coordinate of the rectangle's bottom side. |
| `obj` | `Asset.GMObject \| Constant.All \| Array \| Id.TileMapElement` | The object(s) to check. |
| `prec` | `Bool` | Whether to use precise collision masks (`true`) or bounding boxes (`false`). |
| `notme` | `Bool` | Whether to exclude the calling instance. |
| `array` | `Array` | The array to populate. |
| `ordered` | `Bool` | *(optional)* Whether to sort results by distance. Defaults to `false`. |
| `replace` | `Bool` | *(optional)* Whether to replace the array contents or append to them. Defaults to `false`. |

**Returns:** `Real`
