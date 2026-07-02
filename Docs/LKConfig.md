# Configuration

GMLiftKit's default values for optional parameters are defined as macros in `__LKConfig`. Edit this file to set your preferred defaults project-wide.

## Array

Default for [`array_sample`](LKArray.md#array_sample).

```gml
#macro LK_ARRAY_SAMPLE_REPLACE_DEFAULT false
```

## Audio

Defaults for [`audio_play_sound_range`](LKAudio.md#audio_play_sound_range).

```gml
#macro LK_AUDIO_PLAY_SOUND_RANGE_PRIORITY_DEFAULT    100
#macro LK_AUDIO_PLAY_SOUND_RANGE_PITCH_LOW_DEFAULT  0.95
#macro LK_AUDIO_PLAY_SOUND_RANGE_PITCH_HIGH_DEFAULT 1.05
#macro LK_AUDIO_PLAY_SOUND_RANGE_GAIN_LOW_DEFAULT    0.9
#macro LK_AUDIO_PLAY_SOUND_RANGE_GAIN_HIGH_DEFAULT     1
```

## File

Default for [`json_save`](LKFile.md#json_save).

```gml
#macro LK_JSON_SAVE_PRETTIFY_DEFAULT false
```

## Geometry

Defaults for [`binary_search_distance`](LKGeometry.md#binary_search_distance) and [`find_clear_direction`](LKGeometry.md#find_clear_direction).

```gml
#macro LK_BINARY_SEARCH_DISTANCE_PREC_DEFAULT             false
#macro LK_BINARY_SEARCH_DISTANCE_NOTME_DEFAULT             true
#macro LK_BINARY_SEARCH_DISTANCE_DESIRED_PRECISION_DEFAULT 0.24

#macro LK_FIND_CLEAR_DIRECTION_MAX_DEFAULT 90
```

## Math

Defaults for various [Math](LKMath.md) functions.

```gml
#macro LK_DIGIT_COUNT_INCLUDE_DECIMAL_DEFAULT false
#macro LK_IS_BETWEEN_EXCLUSIVE_DEFAULT        false
#macro LK_NORMALISE_CLAMP_DEFAULT             true
#macro LK_ROUND_STANDARD_AWAY_DEFAULT         true
#macro LK_SIGN_NONZERO_NEGATIVE_IF_ZERO_DEFAULT false
#macro LK_TO_PCT_CLAMP_DEFAULT                true
#macro LK_TO_DEC_CLAMP_DEFAULT                true
#macro LK_TO_STEPS_TYPE_DEFAULT               gamespeed_fps
#macro LK_TO_SECONDS_TYPE_DEFAULT             gamespeed_fps
```

## Random

Default for [`rand_chance`](LKRandom.md#rand_chance).

```gml
#macro LK_RAND_CHANCE_CLAMP_DEFAULT true
```

## String

Defaults for [`bool_stringify`](LKString.md#bool_stringify), [`string_contains`](LKString.md#string_contains), [`string_pad_full`](LKString.md#string_pad_full), [`string_sanitise`](LKString.md#string_sanitise-string_sanitize), [`stringdist_find_closest`](LKString.md#stringdist_find_closest), [`stringdist_find_closest_multi`](LKString.md#stringdist_find_closest_multi), and [`string_truncate`](LKString.md#string_truncate).

```gml
#macro LK_BOOL_STRINGIFY_DEFAULT_IF_TRUE   "true"
#macro LK_BOOL_STRINGIFY_DEFAULT_IF_FALSE "false"

#macro LK_STRING_CONTAINS_CASE_SENSITIVE_DEFAULT true

#macro LK_STRING_PAD_FULL_BIAS_LEFT_DEFAULT        true
#macro LK_STRING_PAD_FULL_FORCE_SEPARATOR_DEFAULT  false

#macro LK_STRING_SANITISE_FILL_DEFAULT           ""
#macro LK_STRING_SANITISE_REMOVE_SLASHES_DEFAULT false
#macro LK_STRING_SANITISE_REMOVE_QUOTES_DEFAULT  false
#macro LK_STRING_SANITISE_EXCEPTIONS_DEFAULT     []

#macro LK_STRINGDIST_FIND_CLOSEST_THRESHOLD_DEFAULT       2
#macro LK_STRINGIDST_FIND_CLOSEST_MULTI_THRESHOLD_DEFAULT 2

#macro LK_STRING_TRUNCATE_SUFFIX_DEFAULT "..."
```

## Struct

Default for [`variable_struct_get_names_alphabetical`](LKStruct.md#variable_struct_get_names_alphabetical).

```gml
#macro LK_VARIABLE_STRUCT_GET_NAMES_ALPHABETICAL_ASCENDING_DEFAULT true
```
