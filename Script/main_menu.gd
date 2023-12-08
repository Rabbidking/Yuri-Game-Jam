extends Control

@onready var options: TextureButton = $GridContainer/Options
@onready var settings_tab_container: Control = $Options/Settings_Tab_Container as SettingsTabContainer

signal exit_options_menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	settings_tab_container.exit_options_menu.connect(_on_options_back_pressed)
	reset_stuff()
	$GridContainer/Start.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"VBoxContainer/Day 1".is_hovered() or $"VBoxContainer/Day 1".has_focus():
		$"VBoxContainer/Day 1/Day 1 Label".add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$"VBoxContainer/Day 1/Day 1 Label".add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
		
	if $"VBoxContainer/Day 2".is_hovered() or $"VBoxContainer/Day 2".has_focus():
		$"VBoxContainer/Day 2/Day 2 Label".add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$"VBoxContainer/Day 2/Day 2 Label".add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
		
	if $"VBoxContainer/Day 3".is_hovered() or $"VBoxContainer/Day 3".has_focus():
		$"VBoxContainer/Day 3/Day 3 Label".add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$"VBoxContainer/Day 3/Day 3 Label".add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
		
	if $"VBoxContainer/Day 4".is_hovered() or $"VBoxContainer/Day 4".has_focus():
		$"VBoxContainer/Day 4/Day 4 Label".add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$"VBoxContainer/Day 4/Day 4 Label".add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
	
	if $"VBoxContainer/Day 5".is_hovered() or $"VBoxContainer/Day 5".has_focus():
		$"VBoxContainer/Day 5/Day 5 Label".add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$"VBoxContainer/Day 5/Day 5 Label".add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
		
	if $VBoxContainer/Back.is_hovered() or $VBoxContainer/Back.has_focus():
		$VBoxContainer/Back/Back.add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$VBoxContainer/Back/Back.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
		
#	if $Options/OptionsBack.is_hovered() or $Options/OptionsBack.has_focus():
#		$Options/OptionsBack/Back.add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
#	else:
#		$Options/OptionsBack/Back.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))


func _on_start_pressed() -> void:
	State.Day = 1
	get_tree().change_scene_to_file("res://Scene/Rooms/garage.tscn")
	#load into the first scene

func _on_level_select_pressed():
	load_game()
	$"VBoxContainer/Day 1".grab_focus()
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
		State.cutscene_playing = true
		get_tree().change_scene_to_file("res://Scene/Rooms/kitchen.tscn")

func _on_day_3_pressed():
	if State.Day_3_unlock == true:
		State.Day = 3
		State.cutscene_playing = true
		get_tree().change_scene_to_file("res://Scene/Rooms/kitchen.tscn")

func _on_day_4_pressed():
	if State.Day_4_unlock == true:
		State.Day = 4
		State.cutscene_playing = true
		get_tree().change_scene_to_file("res://Scene/Rooms/living_room.tscn")

func _on_day_5_pressed():
	if State.Day_5_unlock == true:
		State.Day = 5
		State.cutscene_playing = true
		get_tree().change_scene_to_file("res://Scene/Rooms/living_room.tscn")

func _on_back_pressed():
	$GridContainer/Start.grab_focus()
	$VBoxContainer.visible = false
	$GridContainer.visible = true



func _on_options_back_pressed() -> void:
	exit_options_menu.emit()
	SettingsSignalBus.emit_set_settings_dictionary(SettingsContainer.create_storage_dictionary())
	$Options.visible = false
	$GridContainer.visible = true
	$GridContainer/Start.grab_focus()

func reset_stuff():
	var have_gigi = false
	var used_door = false
	var door_used
	var is_dialog_active = false
	var cutscene_playing = false
	var items = []
	var collected_items = []
	var is_day = false
	var day_1_intro = false
	var night_1_intro = false
	var first_time_found_gigi = false
	var night_1_end = false
	var day_2_intro = false
	var night_2_intro = false
	var hallway_A_car = false
	var garage_first_check_car = false
	var key_taken = false
	var garage_open_trunk = false
	var night_2_end = false
	var day_3_intro = false
	var night_3_intro = false
	var hallway_A_doorbell = false
	var front_ent_recept_first_check = false
	var read_receipt = false
	var password_known = false
	var ordered_return = false
	var bedroom_laptop_no_password = true 
	var living_room_sticky = false
	var gigi_at_entrance = false
	var night_3_end = false
	var day_4_intro = false
	var night_4_intro = false
	var entrance_sound = false
	var have_crowbar = false
	var trapdoor_locked = true
	var living_room_trapdoor = false
	var trapdoor_no_crowbar = true
	var trapdoor_with_crowbar = false
	var gigi_found_in_basement = false
	var night_4_end = false
	var day_5_intro = false
	var night_5_intro = false
	var hallway_A_electric = false
	var garage_trigger = false
	var slot1_empty = true
	var slot2_empty = true
	var slot3_empty = true
	var fuel_cell1 = false
	var fuel_cell2 = false
	var fuel_cell3 = false
	var fuel_cell = 0
	var mimi_is_here = false
	#var mimi_replace_gigi = false
