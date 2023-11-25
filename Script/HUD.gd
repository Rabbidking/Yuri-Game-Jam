extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if State.is_day == true:
		$DayNightIndicator.texture = load("res://Sprites/UI/Day HUD.png")
	else:
		$DayNightIndicator.texture = load("res://Sprites/UI/Night HUD.png")




func _on_pause_pressed() -> void:
	pass # Replace with function body.
