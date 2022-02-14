# Godot Tileset Hotswap

A shader-based approach to hotswapping tileset graphics in Godot, [created for Chucklepie](https://twitter.com/PureAsbestos/status/1491446171403169792)'s [Rex Remake](https://chucklepie.itch.io/rex-remake).
It maps graphics from a 256x256 atlas onto tiles that have their graphics pulled from a 256x256 red/green texture, using a post-processing shader.
Graphics contained in double-atlas.png are copyrighted by their respective owners.
Tilesets and tilemaps created using [Tiled](https://www.mapeditor.org/) and [Tiled Map Importer](https://godotengine.org/asset-library/asset/158).

## How to use
- Pressing the button labeled "Shift" will shift the UV over so that the tiles display graphics from the second half of double-atlas.png.
- Pressing the button labeled "Lookup" will toggle whether the lookup effect which maps the graphics onto the tiles is used or not, letting you see what the red/green tiles look like on their own.
