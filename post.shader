shader_type canvas_item;

uniform sampler2D atlas;
uniform int shift : hint_range(0,1);
uniform bool do_lookup = true;

void fragment() {
	vec2 color = texture(TEXTURE, UV).xy + vec2(0, (float(shift) * 0.5));
	COLOR = do_lookup? texture(atlas, color) : vec4(color, 0, 1.);
}