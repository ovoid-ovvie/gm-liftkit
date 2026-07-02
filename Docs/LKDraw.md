# Draw

---

## draw_arrow

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L156)

```gml
draw_arrow(x1, y1, x2, y2, head_size, thickness)
```

Draws a line from one point to another with an arrowhead at the endpoint.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x1` | `Real` | The x position of the arrow's start. |
| `y1` | `Real` | The y position of the arrow's start. |
| `x2` | `Real` | The x position of the arrow's end (where the head is). |
| `y2` | `Real` | The y position of the arrow's end. |
| `head_size` | `Real` | The size of the arrowhead in pixels. |
| `thickness` | `Real` | *(optional)* The thickness of the arrow line. Defaults to `1`. |

---

## draw_circle_border

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L134)

```gml
draw_circle_border(x, y, radius, thickness)
```

Draws the border of a circle with a given pixel thickness. GML's `draw_circle` with `outline` set to `true` only draws a one-pixel border -- this lets you go thicker.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x position of the circle's centre. |
| `y` | `Real` | The y position of the circle's centre. |
| `radius` | `Real` | The radius of the circle. |
| `thickness` | `Real` | The border thickness in pixels. |

---

## draw_rectangle_border

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L103)

```gml
draw_rectangle_border(x1, y1, x2, y2, thickness)
```

Draws the border of a rectangle with a given pixel thickness. Unlike GML's `draw_rectangle` with `outline` set to `true`, this supports thickness greater than one pixel.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x1` | `Real` | The x position of the top-left corner. |
| `y1` | `Real` | The y position of the top-left corner. |
| `x2` | `Real` | The x position of the bottom-right corner. |
| `y2` | `Real` | The y position of the bottom-right corner. |
| `thickness` | `Real` | The thickness of the border in pixels. |

---

## draw_reset

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L2)

```gml
draw_reset()
```

Resets all global draw state to defaults: alpha to `1`, colour to `c_white`, font to `-1`, halign to `fa_left`, valign to `fa_top`, and blend mode to `bm_normal`.

---

## draw_set_align

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L15)

```gml
draw_set_align(halign, valign)
```

Sets both horizontal and vertical text alignment in a single call.

| Parameter | Type | Description |
|-----------|------|-------------|
| `halign` | `Constant.HAlign` | The horizontal alignment (`fa_left`, `fa_center`, `fa_right`). |
| `valign` | `Constant.VAlign` | The vertical alignment (`fa_top`, `fa_middle`, `fa_bottom`). |

---

## draw_text_aligned

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L74)

```gml
draw_text_aligned(x, y, w, h, text, halign, valign)
```

Draws text aligned within a bounding box. Automatically calculates the correct draw position based on the alignment, then restores the previous alignment state afterwards.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x position of the bounding box. |
| `y` | `Real` | The y position of the bounding box. |
| `w` | `Real` | The width of the bounding box. |
| `h` | `Real` | The height of the bounding box. |
| `text` | `String` | The text to draw. |
| `halign` | `Constant.HAlign` | The horizontal alignment. |
| `valign` | `Constant.VAlign` | The vertical alignment. |

---

## draw_text_outline

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L50)

```gml
draw_text_outline(x, y, text, colour, outline_colour, thickness)
```

Draws text with a solid outline by drawing the text in the outline colour in all four cardinal directions before drawing the main text on top.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x position to draw the text at. |
| `y` | `Real` | The y position to draw the text at. |
| `text` | `String` | The text to draw. |
| `colour` | `Constant.Colour` | The colour of the main text. |
| `outline_colour` | `Constant.Colour` | The colour of the outline. |
| `thickness` | `Real` | The thickness of the outline in pixels. |

---

## draw_text_shadow

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L29)

```gml
draw_text_shadow(x, y, text, shadow_x, shadow_y, shadow_colour, shadow_alpha)
```

Draws text with a shadow at a given offset. Preserves the current draw colour and alpha.

| Parameter | Type | Description |
|-----------|------|-------------|
| `x` | `Real` | The x position to draw the text at. |
| `y` | `Real` | The y position to draw the text at. |
| `text` | `String` | The text to draw. |
| `shadow_x` | `Real` | The horizontal offset of the shadow. |
| `shadow_y` | `Real` | The vertical offset of the shadow. |
| `shadow_colour` | `Constant.Colour` | The colour of the shadow. |
| `shadow_alpha` | `Real` | The alpha of the shadow. |

---

## gui_x

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L115)

```gml
gui_x(_x, camera_id)
```

Converts a world space X coordinate to GUI space for the given camera.

| Parameter | Type | Description |
|-----------|------|-------------|
| `_x` | `Real` | The world space X coordinate to convert. |
| `camera_id` | `Id.Camera` | The camera to use for conversion. |

**Returns:** `Real`

---

## gui_y

[source](../../LiftKit/__LKDraw/__LKDraw.gml#L124)

```gml
gui_y(_y, camera_id)
```

Converts a world space Y coordinate to GUI space for the given camera.

| Parameter | Type | Description |
|-----------|------|-------------|
| `_y` | `Real` | The world space Y coordinate to convert. |
| `camera_id` | `Id.Camera` | The camera to use for conversion. |

**Returns:** `Real`

```gml
// Draw a health bar above an enemy at its world position
draw_rectangle(
    gui_x(enemy.x - 16, camera_get_active()),
    gui_y(enemy.y - 32, camera_get_active()),
    gui_x(enemy.x + 16, camera_get_active()),
    gui_y(enemy.y - 28, camera_get_active()),
    false
);
```
