extends ViewportContainer


func _on_Button_toggled(a):
	material.set_shader_param("shift", int(a))


func _on_Button2_toggled(a):
	material.set_shader_param("do_lookup", not a)
