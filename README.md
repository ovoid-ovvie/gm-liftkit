# GMLiftKit

A comprehensive GML utility library that extends the language with functions that are either missing from GML, or exist but are verbose enough to warrant shorthand.

## Installation

Go to the [Releases](../../releases) page and download the latest `.yymps` file.

There are two ways to import the package:

**Drag and drop** -- drag the `.yymps` file directly onto the GameMaker IDE and it will open the import window automatically.

**Tools menu** -- open your project in GameMaker, go to `Tools > Import Local Package`, and browse to the downloaded `.yymps` file.

Either way, an import window will open showing the package contents. Click `Add All` to select everything, then click `Import`.

## Modules

| Module | Description |
|--------|-------------|
| [Array](Docs/LKArray.md) | Array utilities including subsection support, equalisation, zip/unzip, and more |
| [Audio](Docs/LKAudio.md) | Sound playback with randomised pitch and gain ranges |
| [Camera](Docs/LKCamera.md) | Camera and view utilities |
| [Draw](Docs/LKDraw.md) | Drawing utilities for text, shapes, and coordinate conversion |
| [File](Docs/LKFile.md) | File I/O, INI, and JSON utilities |
| [Geometry](Docs/LKGeometry.md) | Spatial utilities including binary search distance and array-returning collision functions |
| [Layer](Docs/LKLayer.md) | Layer element destruction utilities |
| [Math](Docs/LKMath.md) | Extended math functions including statistics, rounding modes, and the multi\* variadic+array family |
| [Misc](Docs/LKMisc.md) | Miscellaneous utilities |
| [Random](Docs/LKRandom.md) | Probability and weighted random roll functions |
| [Room](Docs/LKRoom.md) | Room navigation utilities |
| [String](Docs/LKString.md) | String utilities including a full case-insensitive function family |
| [Struct](Docs/LKStruct.md) | Struct utilities |

## Configuration

GMLiftKit includes a configuration script (`__LKConfig`) that lets you set global defaults for optional parameters across the library. This means you can configure the library once for your project rather than passing the same arguments every time.

See [Configuration](Docs/LKConfig.md) for a full list of configurable defaults.

## Design Philosophy

GMLiftKit follows two core principles:

**Hard things made easy.** Functions like `binary_search_distance`, the `weighted_roll` family, and the `array_equalise` suite solve problems that are difficult or tedious to implement correctly from scratch.

**Verbose things made readable.** Functions like `to_steps`, `is_between`, `rand_chance`, and `neg` do things GML can already do -- but `to_steps(2.5)` communicates intent instantly in a way that `2.5 * game_get_speed(gamespeed_fps)` does not.

## The `multi*` Function Family

Many math functions in GMLiftKit use a variadic+array hybrid input system. Functions prefixed with `multi` (and their `abs_` variants) accept any combination of individual values and arrays:

```gml
multimean(1, 2, 3)               // individual values
multimean(my_array)              // array
multimean(1, my_array, 3)        // mixed
multimean(array_a, array_b)      // multiple arrays
```

GML's native functions like `max`, `min`, and `mean` are variadic only and don't accept arrays. GMLiftKit bridges this gap.
