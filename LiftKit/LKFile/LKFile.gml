/// @desc This function will copy the specified file, giving it the new name that you choose, but only if there is not already a file with that name.
/// @param {String} fname The name of the file to copy.
/// @param {String} newname The name of the new, copied file.
function file_copy_safe(fname, newname)
{
	if ( file_exists(fname) && !file_exists(newname) )
	{
		file_copy(fname, newname);
	}
}

/// @desc Returns the entire contents of a given file as a string, or undefined if the file couldn't be read.
/// @param {String} filename The path of the file to read.
/// @returns {String|Undefined}
function file_read_all_text(filename)
{
	var buffer = buffer_load(filename);
	
	if ( !buffer_exists(buffer) )
	{
		return undefined;
	}
	
	if ( buffer_get_size(buffer) == 0 )
	{
		buffer_delete(buffer);
		return "";
	}
	
	var result = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);
	return result;
}

/// @desc Creates or overwrites a given file with the given string.
/// @param {String} filename The path of the file to create/overwrite.
/// @param {String} content The content to create/overwrite the file with.
function file_write_all_text(filename, content)
{
	var buffer = buffer_create(string_length(content), buffer_grow, 1);
	buffer_write(buffer, buffer_text, content);
	buffer_save(buffer, filename);
	buffer_delete(buffer);
}

/// @desc Reads a .ini string entry as a boolean.
/// @param {String} section The section of the .ini to read from.
/// @param {String} key The key within the relevant section of the .ini to read from.
/// @param {Bool|Real} _default The value to return if the given .ini entry cannot be read.
/// @param {Bool} use_string Whether to use a string (true) or a real (false). Defaults to false.
/// @returns {Bool}
function ini_read_bool(section, key, _default, use_string = false)
{
	var std;
	if ( use_string )
	{
		std = ( bool(_default) ) ? "true" : "false";
		return ( ini_read_string(section, key, std) == "true" );
	}
	else
	{
		std = ( bool(_default) ) ? 1 : 0;
		return ( ini_read_real(section, key, std) > 0.5 );
	}
}

/// @desc Writes a boolean as a string value as an entry in a .ini file.
/// @param {String} section The section of the .ini to write to.
/// @param {String} key The key within the relevant section of the .ini to write to.
/// @param {Bool|Real} input_value The value to write to the relevant destination.
/// @param {Bool} use_string Whether to use a string (true) or a real (false). Defaults to false.
function ini_write_bool(section, key, input_value, use_string = false)
{
	var output;
	if ( use_string )
	{
		output = ( bool(input_value) ) ? "true" : "false";
		ini_write_string(section, key, output);
	}
	else
	{
		output = ( bool(input_value) ) ? 1 : 0;
		ini_write_real(section, key, output);
	}
}

/// @desc Loads a given JSON file into a GML value (struct/array/string/real).
/// @param {String} filename The path of the JSON file to load.
/// @param {Function} [filter] A filter function allowing more fine-grained control over parsing specific values.
/// @param {Bool} [raw] Indicates whether special strings should be converted or treated as regular strings.
/// @returns {Any|Undefined}
function json_load(filename, filter = undefined, raw = false)
{
	var content = file_read_all_text(filename);
	if ( is_undefined(content) )
	{
		return undefined;
	}
	
	try 
	{
		return json_parse(content, filter, raw);
	}
	catch (_)
	{
		// if the file content isn't a valid JSON, prevent crash and return undefined instead
		return undefined;
	}
}

/// @desc Saves a given GML value (struct/array/string/real) into a JSON file.
/// @param {String} filename The path of the JSON file to save.
/// @param {Any} value The value to save as a JSON file.
/// @param {Bool} [prettify] Whether to include indentatiosn and newlines for readability.
/// @param {Function} [filter] A filter function allowing more fine-grained control over formatting specific values.
function json_save(filename, value, prettify = LK_JSON_SAVE_PRETTIFY_DEFAULT, filter = undefined)
{
	var content = json_stringify(value, prettify, filter);
	file_write_all_text(filename, content);
}