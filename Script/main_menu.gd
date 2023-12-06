extends Control

@onready var options: TextureButton = $GridContainer/Options
@onready var settings_tab_container: Control = $Options/Settings_Tab_Container as SettingsTabContainer

signal exit_options_menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings_tab_container.exit_options_menu.connect(_on_options_back_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	State.Day = 1
	get_tree().change_scene_to_file("res://Scene/Rooms/garage.tscn")
	#load into the first scene

func _on_level_select_pressed():
	load_game()
	$VBoxContainer.visible = true
	$GridContainer.visible = false
	if State.Day_2_unlock == true:
		$"VBoxContainer/Day 2".texture_normal = load("res://Sprites/UI/Blank_Blue.png")
	elif State.Day_2_unlock == false:
		$"VBoxContainer/Day 2".texture_normal = load("res://Sprites/UI/Blank_Gray.png")
	if State.Day_3_unlock == true:
		$"VBoxContainer/Day 3".texture_normal = load("res://Sprites/UI/Blank_Blue.png")
	elif State.Day_3_unlock == false:
		$"VBoxContainer/Day 3".texture_normal = load("res://Sprites/UI/Blank_Gray.png")
	if State.Day_4_unlock == true:
		$"VBoxContainer/Day 4".texture_normal = load("res://Sprites/UI/Blank_Blue.png")
	elif State.Day_4_unlock == false:
		$"VBoxContainer/Day 4".texture_normal = load("res://Sprites/UI/Blank_Gray.png")
	if State.Day_5_unlock == true:
		$"VBoxContainer/Day 5".texture_normal = load("res://Sprites/UI/Blank_Blue.png")
	elif State.Day_5_unlock == false:
		$"VBoxContainer/Day 5".texture_normal = load("res://Sprites/UI/Blank_Gray.png")
		
		
func _on_options_pressed() -> void:
	$GridContainer.visible = false
	$Options.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func load_game():
	if not FileAccess.file_exists("user://yurisavegame.save"):
		return
		
	var save_game = FileAccess.open("user://yurisavegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		State.Day_2_unlock = node_data["day_2_unlock"]
		State.Day_3_unlock = node_data["day_3_unlock"]
		State.Day_4_unlock = node_data["day_4_unlock"]
		State.Day_5_unlock = node_data["day_5_unlock"]

func _on_day_1_pressed():
	State.Day = 1
	get_tree().change_scene_to_file("res://Scene/Rooms/garage.tscn")

func _on_day_2_pressed():
	if State.Day_2_unlock == true:
		State.Day = 2
		get_tree().change_scene_to_file("res://Scene/Rooms/kitchen.tscn")

func _on_day_3_pressed():
	if State.Day_3_unlock == true:
		State.Day = 3
		get_tree().change_scene_to_file("res://Scene/Rooms/kitchen.tscn")

func _on_day_4_pressed():
	if State.Day_4_unlock == true:
		State.Day = 4
		get_tree().change_scene_to_file("res://Scene/Rooms/living_room.tscn")

func _on_day_5_pressed():
	if State.Day_5_unlock == true:
		State.Day = 5
		get_tree().change_scene_to_file("res://Scene/Rooms/living_room.tscn")

func _on_back_pressed():
	$VBoxContainer.visible = false
	$GridContainer.visible = true



func _on_options_back_pressed() -> void:
	exit_options_menu.emit()
	SettingsSignalBus.emit_set_settings_dictionary(SettingsContainer.create_storage_dictionary())
	$Options.visible = false
	$GridContainer.visible = true
