extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	State.Day = 1
	get_tree().change_scene_to_file("res://Scene/Rooms/garage.tscn")
	#load into the first scene


func _on_options_pressed() -> void:
	pass # Replace with function body.
	#Options Menu here


func _on_quit_pressed() -> void:
	get_tree().quit()