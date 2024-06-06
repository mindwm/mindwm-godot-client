extends Sprite2D


## A Godot object that moves randomly around the screen.
var feed : CaptureFeed

@onready var _ClickPolygon: CollisionPolygon2D = $"%ClickPolygon"

func _ready() -> void:
	_initialize_capture()
	

func _initialize_capture() -> void:
	var cs = CaptureServer;
	print(cs)
	for f in cs.feeds():
		print("%s: %s" % [f.get_wm_name(), f.get_wm_class()])

	for f in cs.feeds():
		print("%s: %s" % [f.get_wm_name(), f.get_wm_class()])
		#if f.get_wm_class() == "Navigator":
			#feed = f
			#break
			
		if f.get_wm_name() == "Alacritty":
			feed = f
			break

	if !feed:
		return

	print("using %s (%s)" % [feed, feed.get_wm_name()])

	feed.feed_is_active = true
	
	var t : Texture2D = material.get_shader_parameter("tex")
	t.capture_feed_id = feed.get_id()
	material.set_shader_parameter("tex", t)
	
func _physics_process(_delta: float) -> void:
	_update_click_polygon()
	CaptureServer.update(feed)
	var t : Texture2D = material.get_shader_parameter("tex")
	var tsz = t.get_size()
	print("tex.size: %s" % tsz)
	scale.x = (tsz.x / 128) * 0.3
	scale.y = (tsz.y / 128) * 0.3
	global_position = feed.get_position()
	#print("pos: %s, geom: %s" % [feed.get_position(), feed.get_geom()])


## Updates the clickable area, preventing inputs from passing through the
## window outside of the defined region.
func _update_click_polygon() -> void:
	var click_polygon: PackedVector2Array = _ClickPolygon.polygon
	for vec_i in range(click_polygon.size()):
		click_polygon[vec_i] = to_global(click_polygon[vec_i])
	get_window().mouse_passthrough_polygon = click_polygon


## A simple function that changes the position of the Godot icon randomly.
func _on_click_area_input_event(_viewport: Node, event: InputEvent,
		_shape_idx: int) -> void:
	pass
	#if event is InputEventMouseButton and event.is_pressed():
		#var window_size: Vector2i = get_window().size
		#global_position = Vector2(randf_range(0, window_size.x),
				#randf_range(0, window_size.y))
