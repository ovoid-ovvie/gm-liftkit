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