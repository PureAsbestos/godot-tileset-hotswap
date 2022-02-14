extends Node

onready var root = get_tree().root
onready var base_size = root.get_visible_rect().size

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
	if get_tree().connect("screen_resized", self, "_on_screen_resized") != OK:
		print_debug("An error occurred while connecting the screen_resized signal.")

	root.set_attach_to_screen_rect(root.get_visible_rect())
	_on_screen_resized()

func _on_screen_resized():
	var new_window_size = OS.window_size

	var scale_w = max(int(new_window_size.x / base_size.x), 1)
	var scale_h = max(int(new_window_size.y / base_size.y), 1)
	var scale = min(scale_w, scale_h)

	var diff = new_window_size - (base_size * scale)
	var diffhalf = (diff * 0.5).floor()

	root.set_attach_to_screen_rect(Rect2(diffhalf, base_size * scale))

	# Black bars to prevent flickering:
	var odd_offset = Vector2(int(new_window_size.x) % 2, int(new_window_size.y) % 2)

	VisualServer.black_bars_set_margins(
		int(max(diffhalf.x, 0)), # prevent negative values, they make the black bars go in the wrong direction.
		int(max(diffhalf.y, 0)),
		int(max(diffhalf.x, 0)) + odd_offset.x,
		int(max(diffhalf.y, 0)) + odd_offset.y
	)

func _input(event):
	if event.is_action_released("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		
