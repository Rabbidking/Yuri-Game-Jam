extends Control

signal exit_options_menu

func _ready() -> void:
	$GridContainer/Continue.grab_focus()


var is_paused: bool = false:
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused
		$"../HUD".visible = !visible
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		is_paused = !is_paused


func _on_continue_pressed() -> void:
	is_paused = false
	$"../HUD".visible = true


func _on_save_pressed() -> void:
	pass # Replace with function body.


func _on_load_pressed() -> void:
	pass # Replace with function body.


func _on_options_pressed() -> void:
	$Options.visible = true
	$GridContainer.visible = false


func _on_quit_pressed() -> void:
	is_paused = false
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")


func _on_options_back_pressed() -> void:
	exit_options_menu.emit()
	SettingsSignalBus.emit_set_settings_dictionary(SettingsContainer.create_storage_dictionary())
	$Options.visible = false
	$GridContainer.visible = true
	$GridContainer/Continue.grab_focus()
