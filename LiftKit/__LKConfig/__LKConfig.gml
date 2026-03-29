////////////
//        //
//  Audio //
//        //
////////////

// Default values for function `audio_play_sound_range`
#macro LK_AUDIO_PLAY_SOUND_RANGE_PRIORITY_DEFAULT    100
#macro LK_AUDIO_PLAY_SOUND_RANGE_PITCH_LOW_DEFAULT  0.95
#macro LK_AUDIO_PLAY_SOUND_RANGE_PITCH_HIGH_DEFAULT 1.05
#macro LK_AUDIO_PLAY_SOUND_RANGE_GAIN_LOW_DEFAULT    0.9
#macro LK_AUDIO_PLAY_SOUND_RANGE_GAIN_HIGH_DEFAULT     1

////////////
//        //
//  File  //
//        //
////////////

// Default value for whether the function `json_save`
// prettifies the file
#macro LK_JSON_SAVE_PRETTIFY_DEFAULT false

////////////////
//            //
//  Geometry  //
//            //
////////////////

// Defaults values for the `binary_search_distance` function
#macro LK_BINARY_SEARCH_DISTANCE_PREC_DEFAULT             false
#macro LK_BINARY_SEARCH_DISTANCE_NOTME_DEFAULT             true
#macro LK_BINARY_SEARCH_DISTANCE_DESIRED_PRECISION_DEFAULT 0.24

// Default maximum accepted angle for function
// `find_clear_direction`
#macro LK_FIND_CLEAR_DIRECTION_MAX_DEFAULT 90

////////////
//        //
//  Math  //
//        //
////////////

// Default value for whether the function `digit_count`
// counts (true) or ignores (false) digits after
// the decimal point
#macro LK_DIGIT_COUNT_INCLUDE_DECIMAL_DEFAULT false

// Default value for whether the function `is_between`
// excludes (true) or includes (false) the range's bounds
#macro LK_IS_BETWEEN_EXCLUSIVE_DEFAULT false

// Default value for whether the function
// `normalise`/`normalize` clamps its results
// between 0 and 1 (true) or not (false)
#macro LK_NORMALISE_CLAMP_DEFAULT true

// Default value for whether the function `round_standard`
// rounds away from zero (true) or not (false)
#macro LK_ROUND_STANDARD_AWAY_DEFAULT true

// Default value for whether the function `sign_nonzero`
// returns -1 (true) or 1 (false) if the input value is 0
#macro LK_SIGN_NONZERO_NEGATIVE_IF_ZERO_DEFAULT false

// Default values for whether the functions `to_pct`
// and `to_dec` will clamp their results
#macro LK_TO_PCT_CLAMP_DEFAULT true
#macro LK_TO_DEC_CLAMP_DEFAULT true

// Default values for which type of game speed constant
// the functions `to_steps` and `to_seconds` use
#macro LK_TO_STEPS_TYPE_DEFAULT   gamespeed_fps
#macro LK_TO_SECONDS_TYPE_DEFAULT gamespeed_fps

//////////////
//          //
//  Random  //
//          //
//////////////

// Default value for toggling clamping of the result for the
// `rand_chance` function
#macro LK_RAND_CHANCE_CLAMP_DEFAULT true

//////////////
//          //
//  String  //
//          //
//////////////

// Default values for the `bool_stringify` function
#macro LK_BOOL_STRINGIFY_DEFAULT_IF_TRUE   "true"
#macro LK_BOOL_STRINGIFY_DEFAULT_IF_FALSE "false"

// Default value for toggling case sensitivity in the
// function `string_contains`
#macro LK_STRING_CONTAINS_CASE_SENSITIVE_DEFAULT true

// Default values for the function `string_pad_full`
#macro LK_STRING_PAD_FULL_BIAS_LEFT_DEFAULT         true
#macro LK_STRING_PAD_FULL_FORCE_SEPARATOR_DEFAULT   false