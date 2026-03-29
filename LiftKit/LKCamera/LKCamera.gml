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