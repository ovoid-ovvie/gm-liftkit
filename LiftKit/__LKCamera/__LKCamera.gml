/// @desc Returns the centre point of the given camera's view as an array of [x, y].
/// @param {Id.Camera} cam_id The camera to get the centre of.
/// @returns {Array<Real>}
/// @pure
function camera_get_centre(cam_id)
{
	var _posX = camera_get_view_x(cam_id);
	var _posY = camera_get_view_y(cam_id);
	_posX += camera_get_view_width(cam_id) / 2;
	_posY += camera_get_view_height(cam_id) / 2;
	return {x:_posX, y:_posY};
}

/// @desc Returns the centre point of the given camera's view as an array of [x, y]. Alias of `camera_get_centre()`.
/// @param {Id.Camera} cam_id The camera to get the centre of.
/// @returns {Array<Real>}
/// @pure
function camera_get_center(cam_id)
{
	return camera_get_centre(cam_id);
}

/// @desc Checks if a point is inside the given camera's view.
/// @param {Real} px X coordinate of the point
/// @param {Real} py Y coordinate of the point
/// @param {Id.Camera} cam_id Camera ID to check
/// @returns {Bool} True if inside view, false otherwise.
function point_in_view(px, py, cam_id)
{
	// - get view as rectangle -
	var cam_x = camera_get_view_x(cam_id);
	var cam_y = camera_get_view_y(cam_id);
	var cam_w = camera_get_view_width(cam_id);
	var cam_h = camera_get_view_height(cam_id);
	
	// - assess result -
	return ( px >= cam_x && px <= cam_x + cam_w 
	&&       py >= cam_y && py <= cam_y + cam_h );
}

/// @desc Checks if any part of a rectangle overlaps the given camera's view (true) or not (false).
/// @param {Real} x1 The x position of the left side of the rectangle.
/// @param {Real} y1 The y position of the top side of the rectangle.
/// @param {Real} x2 The x position of the right side of the rectangle.
/// @param {Real} y2 The y position of the bottom side of the rectangle.
/// @param {Id.Camera} cam_id The camera to check against.
/// @returns {Bool}
/// @pure
function rect_in_view(x1, y1, x2, y2, cam_id)
{
	var _cam_x = camera_get_view_x(cam_id);
	var _cam_y = camera_get_view_y(cam_id);
	var _cam_x2 = _cam_x + camera_get_view_width(cam_id);
	var _cam_y2 = _cam_y + camera_get_view_height(cam_id);
	
	return ( x2 >= _cam_x && x1 <= _cam_x2
	&&       y2 >= _cam_y && y1 <= _cam_y2 );
}