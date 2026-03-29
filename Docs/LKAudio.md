# Audio

---

## audio_play_sound_range -- [source](../../LiftKit/scripts/LKAudio/LKAudio.gml#L9)

```gml
audio_play_sound_range(sound, priority, loop, pitch_low, pitch_high, gain_low, gain_high)
```

Plays a sound with a randomly chosen pitch and gain within the specified ranges. All parameters except `sound` are optional and configurable via [`__LKConfig`](LKConfig.md).

| Parameter | Type | Description |
|-----------|------|-------------|
| `sound` | `Asset.GMSound` | The sound to play. |
| `priority` | `Real` | *(optional)* Playback priority. Defaults to `100`. |
| `loop` | `Bool` | *(optional)* Whether to loop the sound. Defaults to `false`. |
| `pitch_low` | `Real` | *(optional)* The minimum pitch multiplier. Defaults to `0.95`. |
| `pitch_high` | `Real` | *(optional)* The maximum pitch multiplier. Defaults to `1.05`. |
| `gain_low` | `Real` | *(optional)* The minimum gain multiplier. Defaults to `0.9`. |
| `gain_high` | `Real` | *(optional)* The maximum gain multiplier. Defaults to `1`. |

```gml
// Play with default variation
audio_play_sound_range(snd_footstep);

// Play with custom pitch range
audio_play_sound_range(snd_explosion, 100, false, 0.8, 1.2);
```
