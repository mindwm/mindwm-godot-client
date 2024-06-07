extends Node2D

var dbus := DBus.new()

## The main screen the app uses.


func _ready() -> void:
	if dbus.connect(dbus.DBUS_BUS_SESSION) != OK:
		print("Unable to connect to session DBUS")

	_initialize_window()


func _initialize_window() -> void:
	# You don't need to change all of these settings via a function during
	# runtime since you can set them from the settings menu at Project ->
	# Project Settings -> Window.
	var window: Window = get_window()
	# Setting the viewport width and height from the project settings still
	# displays the boot splash, which is undesirable for a transparent app.
	# To avoid this, set the viewport width and height from the project
	# settings to 0, and then use the two functions provided below. You can
	# read the documentation for these functions to learn about what they do.
	window.size = Vector2i(DisplayServer.screen_get_size() + Vector2i(1, 1))
	window.position = DisplayServer.screen_get_position()
	#window.position = Vector2(0,0)
#	window.always_on_top = true
#	window.borderless = true
	# Enabling Per Pixel Transparency -> Allowed through code doesn't work, as
	# the global variables ProjectSettings contain aren't updated when changed.
	# Make sure to enable it via the Project Settings menu.
#	ProjectSettings.set_setting("display/window/per_pixel_transparency/allowed",
#			true)
#	window.transparent = true
	# If you have multiple windows in your project, you can
	# modify the additional viewports' settings from the inspector.
#	window.transparent_bg = true

func _physics_process(delta: float) -> void:
	var gp = $Godot.global_position
	var sz : Vector2i = $Godot.size
	#print("Window GP: %s" % gp)
	$HUD.set_global_position(Vector2(gp.x-28,gp.y-236))
	var p : PanelContainer = $HUD/PanelContainer/VBoxContainer/PanelContainer
	#var sb = $HUD/PanelContainer/VBoxContainer/PanelContainer/
	var sb : StyleBox = p.get_theme_stylebox("panel")
	sb.content_margin_top = sz.y
	p.add_theme_stylebox_override("panel", sb);
	#$HUD/PanelContainer/VBoxContainer/Panel.add_theme_constant_override("margin_top", sz.y)
