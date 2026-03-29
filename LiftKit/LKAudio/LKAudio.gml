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