extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if State.is_day == true:
		$DayNightIndicator.texture = load("res://Sprites/UI/Day HUD.png")
	else:
		$DayNightIndicator.texture = load("res://Sprites/UI/Night HUD.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_button_down() -> void:
	# open pause menu
	pass # Replace with function body.
