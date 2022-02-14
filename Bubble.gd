extends Sprite


func _on_Button_toggled(a):
	material.set_shader_param("shift", int(a))

var start_pos = position
var t = 0
func _process(delta):
	position = start_pos + Vector2(cos(t), sin(t))*10
	t += delta
