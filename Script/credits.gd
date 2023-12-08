extends Control

func _ready():
	$"Return To Menu".grab_focus()
	
func _on_return_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
	$"Return To Menu".grab_focus()
