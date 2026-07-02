/// @desc Plays a sound within a range of pitch and gain.
/// @param {Asset.GMSound} sound
/// @param {Real} [priority]
/// @param {Bool} [loop]
/// @param {Real} [pitch_low]
/// @param {Real} [pitch_high]
/// @param {Real} [gain_low]
/// @param {Real} [gain_high]
function audio_play_sound_range
(
	sound,
	priority = LK_AUDIO_PLAY_SOUND_RANGE_PRIORITY_DEFAULT,
	loop = false,
	pitch_low = LK_AUDIO_PLAY_SOUND_RANGE_PITCH_LOW_DEFAULT,
	pitch_high = LK_AUDIO_PLAY_SOUND_RANGE_PITCH_HIGH_DEFAULT,
	gain_low = LK_AUDIO_PLAY_SOUND_RANGE_GAIN_LOW_DEFAULT,
	gain_high = LK_AUDIO_PLAY_SOUND_RANGE_GAIN_HIGH_DEFAULT
)
{
	var ref_sound = audio_play_sound(sound, priority, loop);
	audio_sound_pitch(ref_sound, random_range(pitch_low, pitch_high));
	audio_sound_gain(ref_sound, random_range(gain_low, gain_high), 0);
}

function audio_fade_out(sound_ref, duration)
{
	if ( !audio_is_playing(sound_ref) ) return;
	
	var _state = {
		sound_ref: sound_ref,
		duration: duration,
		step: 0,
		start_gain: audio_sound_get_gain(sound_ref),
		ts: -1
	};
	
	_state.ts = time_source_create(time_source_game, 1, time_source_units_frames, method(_state, function()
	{
		step++;
		if ( !audio_is_playing(sound_ref) )
		{
			time_source_destroy(ts);
			return;
		}
		
		var _t = step / duration;
		if ( _t >= 1 )
		{
			audio_stop_sound(sound_ref);
			time_source_destroy(ts);
			return;
		}
		
		audio_sound_gain(sound_ref, lerp(start_gain, 0, _t), 0);
	}), [], duration);
	
	time_source_start(_state.ts);
}