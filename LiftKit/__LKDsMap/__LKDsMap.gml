/// @desc Converts a DS Map to a struct and returns the result.
/// @param {Id.DsMap} map The ID of the map to convert.
/// @param {Bool} destroy Whether to destroy the map after converting (true) or not (false).
/// @returns {Struct}
/// @pure
function ds_map_to_struct(map)
{
	var _struct = {};
	var _key = ds_map_find_first(map);
	
	while ( !is_undefined(_key) )
	{
		var _val = ds_map_find_value(map, _key);
		_struct[$ string(_key)] = variable_clone(_val);
		_key = ds_map_find_next(map, _key);
	}
	
	return _struct;
}

/// @desc Converts a struct to a DS Map and returns the result.
/// @param {Struct} struct The struct to convert.
/// @returns {Id.DsMap}
/// @pure
function ds_map_create_from_struct(struct)
{
	var _map = ds_map_create();
	var _keys = struct_get_names(struct);
	var _iter = array_length(_keys);
	for (var i = 0; i < _iter; i++)
	{
		var _key = _keys[i];
		ds_map_add(_map, _key, struct[$ _key]);
	}
	return _map;
}