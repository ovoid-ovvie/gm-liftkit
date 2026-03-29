/// @desc Resets global draw parameters (alpha, colour, font, halign, valign, blendmode).
function draw_reset()
{
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	gpu_set_blendmode(bm_normal);
}

/// @desc Sets the horizontal and vertical alignment of drawn text at the same time.
/// @param {Constant.HAlign} halign
/// @param {Constant.VAlign} valign
function draw_set_align(halign, valign)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}

/// @desc Draws text with a shadow offset by the given amount.
/// @param {Real} x The x position to draw the text at.
/// @param {Real} y The y position to draw the text at.
/// @param {String} text The text to draw.
/// @param {Real} shadow_x The horizontal offset of the shadow.
/// @param {Real} shadow_y The vertical offset of the shadow.
/// @param {Constant.Colour} shadow_colour The colour of the shadow.
/// @param {Real} shadow_alpha The alpha of the shadow.
function draw_text_shadow(x, y, text, shadow_x, shadow_y, shadow_colour, shadow_alpha)
{
	var prev_colour = draw_get_colour();
	var prev_alpha = draw_get_alpha();
	
	draw_set_colour(shadow_colour);
	draw_set_alpha(shadow_alpha);
	draw_text(x + shadow_x, y + shadow_y, text);
	
	draw_set_colour(prev_colour);
	draw_set_alpha(prev_alpha);
	draw_text(x, y, text);
}

/// @desc Draws text with a solid outline by drawing the text in the outline colour in all four cardinal directions before drawing the text in the foreground colour on top.
/// @param {Real} x The x position to draw the text at.
/// @param {Real} y The y position to draw the text at.
/// @param {String} text The text to draw.
/// @param {Constant.Colour} colour The colour of the text.
/// @param {Constant.Colour} outline_colour The colour of the outline.
/// @param {Real} thickness The thickness of the outline in pixels.
function draw_text_outline(x, y, text, colour, outline_colour, thickness)
{
	var prev_colour = draw_get_colour();
	
	draw_set_colour(outline_colour);
	draw_text(x - thickness, y, text);
	draw_text(x + thickness, y, text);
	draw_text(x, y - thickness, text);
	draw_text(x, y + thickness, text);
	
	draw_set_colour(colour);
	draw_text(x, y, text);
	
	draw_set_colour(prev_colour);
}

/// @desc Draws text aligned within a bounding box, restoring the previous alignment afterwards.
/// @param {Real} x The x position of the bounding box.
/// @param {Real} y The y position of the bounding box.
/// @param {Real} w The width of the bounding box.
/// @param {Real} h The height of the bounding box.
/// @param {String} text The text to draw.
/// @param {Constant.HAlign} halign The horizontal alignment of the text.
/// @param {Constant.VAlign} valign The vertical alignment of the text.
function draw_text_aligned(x, y, w, h, text, halign, valign)
{
	var prev_halign = draw_get_halign();
	var prev_valign = draw_get_valign();
	
	draw_set_halign(halign);
	draw_set_valign(valign);
	
	var tx = x;
	var ty = y;
	
	if ( halign == fa_center ) tx = x + w / 2;
	else if ( halign == fa_right ) tx = x + w;
	
	if ( valign == fa_middle ) ty = y + h / 2;
	else if ( valign == fa_bottom ) ty = y + h;
	
	draw_text(tx, ty, text);
	
	draw_set_halign(prev_halign);
	draw_set_valign(prev_valign);
}

/// @desc Draws the border of a rectangle with a given thickness.
/// @param {Real} x1 The x position of the top-left corner.
/// @param {Real} y1 The y position of the top-left corner.
/// @param {Real} x2 The x position of the bottom-right corner.
/// @param {Real} y2 The y position of the bottom-right corner.
/// @param {Real} thickness The thickness of the border in pixels.
function draw_rectangle_border(x1, y1, x2, y2, thickness)
{
	draw_rectangle(x1, y1, x2, y1 + thickness - 1, false);
	draw_rectangle(x1, y2 - thickness + 1, x2, y2, false);
	draw_rectangle(x1, y1, x1 + thickness - 1, y2, false);
	draw_rectangle(x2 - thickness + 1, y1, x2, y2, false);
}

/// @desc Converts world space X coordinates to GUI space.
/// @param {Real} _x
/// @param {Id.Camera} camera_id
/// @returns {Real}
function gui_x(_x, camera_id)
{
	return (_x - camera_get_view_x(camera_id)) * (display_get_gui_width() / camera_get_view_width(camera_id)); 
}

/// @desc Converts world space Y coordinates to GUI space.
/// @param {Real} _y
/// @param {Id.Camera} camera_id
/// @returns {Real}
function gui_y(_y, camera_id)
{
	return (_y - camera_get_view_y(camera_id)) * (display_get_gui_height() / camera_get_view_height(camera_id));
}