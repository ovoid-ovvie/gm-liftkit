/// @desc Destroys all sprite elements from the given layer.
/// @param {String|Id.Layer} layer The layer to remove the elements from.
function layer_destroy_sprites(layer)
{
	var elements = layer_get_all_elements(layer);
	array_foreach(elements, function(element) {
		if ( layer_get_element_type(element) == layerelementtype_sprite)
		{
			layer_sprite_destroy(element);
		}
	});
}

/// @desc Destroys all text elements from the given layer.
/// @param {String|Id.Layer} layer The layer to remove the elements from.
function layer_destroy_text(layer)
{
	var elements = layer_get_all_elements(layer);
	array_foreach(elements, function(element) {
		if ( layer_get_element_type(element) == layerelementtype_text )
		{
			layer_text_destroy(element);
		}
	});
}

/// @desc Destroys all sequences from the given layer.
/// @param {String|Id.Layer} layer The layer to remove the elements from.
function layer_destroy_sequences(layer)
{
	var elements = layer_get_all_elements(layer);
	array_foreach(elements, function(element) {
		if ( layer_get_element_type(element) == layerelementtype_sequence )
		{
			layer_sequence_destroy(element);
		}
	});
}

/// @desc Destroys all backgrounds from the given layer.
/// @param {String|Id.Layer} layer The layer to remove the elements from.
function layer_destroy_backgrounds(layer)
{
	var elements = layer_get_all_elements(layer);
	array_foreach(elements, function(element) {
		if ( layer_get_element_type(element) == layerelementtype_background )
		{
			layer_background_destroy(element);
		}
	});
}

/// @desc Destroys all tilemaps from the given layer.
/// @param {String|Id.Layer} layer The layer to remove the elements from.
function layer_destroy_tilemap(layer)
{
	var elements = layer_get_all_elements(layer);
	array_foreach(elements, function(element) {
		if ( layer_get_element_type(element) == layerelementtype_tilemap )
		{
			layer_tilemap_destroy(element);
		}
	});
}