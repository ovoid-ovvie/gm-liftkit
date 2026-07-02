/// @desc Functions the same way as `room_goto` except uses a string for the room name.
/// @param {String} _room
function room_goto_string(_room)
{
	if ( is_string(_room) )
	{
		var room_index = asset_get_index(_room);
		if ( room_index != -1 )
		{
			room_goto(room_index);
		}
	}
}

/// @desc Checks if a given room has a phyics world (true) or not (false). Always returns false if the room does not exist.
/// @param {Asset.GMRoom} _room The room to check.
/// @returns {Bool}
function room_has_physics_world(_room)
{
	if ( !room_exists(_room) )
	{
		return false;
	}
	var _info = room_get_info(_room);
	return _info.physicsWorld;
}
