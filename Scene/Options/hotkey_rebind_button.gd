class_name HotkeyRebindButton
extends Control

@onready var label: Label = $HBoxContainer/Label as Label
@onready var button: Button = $HBoxContainer/Button as Button

@export var action_name: String = "left"

func _ready() -> void:
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()
	load_keybinds()
	
	
func load_keybinds() -> void:
	rebind_action_key(SettingsContainer.get_keybind(action_name))

func set_action_name() -> void:
	label.text = "Unassigned"
	
	match action_name:
		"up":
			label.text = "Move Up"
		"down":
			label.text = "Move Down"
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move Right"
		"interact":
			label.text = "Interact"
		"pause":
			label.text = "Pause"

func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	print(action_events)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode


func _on_button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		button.text = "Press any key..."
		set_process_unhandled_key_input(button_pressed)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
				
	else:
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
				
		set_text_for_key()

func _unhandled_key_input(event: InputEvent):
	rebind_action_key(event)
	button.button_pressed = false

func rebind_action_key(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	SettingsContainer.set_keybind(action_name, event)
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()
	
#	var is_duplicate = false
#	var action_event = event
#	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
#
#	for i in get_tree().get_nodes_in_group("hotkey_button"):
#		if i.action_name != self.action_name:
#			if i.button.text == "%s" % action_keycode:
#				is_duplicate = true
#				break
#
#	if not is_duplicate:
#		InputMap.action_erase_events(action_name)
#		InputMap.action_add_event(action_name,event)
#		SettingsContainer.set_keybind(action_name, event)
#
#		set_process_unhandled_key_input(false)
#		set_text_for_key()
#		set_action_name()
