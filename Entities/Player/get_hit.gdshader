shader_type spatial;
render_mode unshaded, cull_disabled, depth_draw_opaque, depth_prepass_alpha;

uniform bool active = false;
uniform vec4 flash_color: source_color = vec4(1.0,1.0,1.0,1.0); 
uniform sampler2D tex: source_color, filter_nearest; // A copy of the texture for the Sprite3D or AnimatedSprite3D 

void vertex() {
	MODELVIEW_MATRIX = VIEW_MATRIX * mat4(INV_VIEW_MATRIX[0], INV_VIEW_MATRIX[1], INV_VIEW_MATRIX[2], MODEL_MATRIX[3]);
}

void fragment() {
	vec4 col = texture(tex,UV);
	vec4 set_col = col;
	if(active == true) {
		set_col = flash_color;
	}
	ALBEDO = vec3(set_col.r,set_col.g,set_col.b);
	ALPHA = col.a;
}