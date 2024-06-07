extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_hud_show() -> void:
	print("exposing HUD")
	visible = true

func _on_hud_hide() -> void:
	print("hiding HUD")
	visible = false

func _on_hud_switch() -> void:
	print("switching HUD visibility")
	visible = !visible
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
