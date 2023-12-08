extends Control

@onready var options: TextureButton = $GridContainer/Options
#@onready var settings_tab_container: Control = $Options/Settings_Tab_Container as SettingsTabContainer

signal exit_options_menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#settings_tab_container.exit_options_menu.connect(_on_options_back_pressed)
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
	State.have_gigi = false
	State.used_door = false
	State.door_used
	State.is_dialog_active = false
	State.cutscene_playing = false
	State.items = []
	State.collected_items = []
	State.is_day = false
	State.day_1_intro = false
	State.night_1_intro = false
	State.first_time_found_gigi = false
	State.night_1_end = false
	State.day_2_intro = false
	State.night_2_intro = false
	State.hallway_A_car = false
	State.garage_first_check_car = false
	State.key_taken = false
	State.garage_open_trunk = false
	State.night_2_end = false
	State.day_3_intro = false
	State.night_3_intro = false
	State.hallway_A_doorbell = false
	State.front_ent_recept_first_check = false
	State.read_receipt = false
	State.password_known = false
	State.ordered_return = false
	State.bedroom_laptop_no_password = true 
	State.living_room_sticky = false
	State.gigi_at_entrance = false
	State.night_3_end = false
	State.day_4_intro = false
	State.night_4_intro = false
	State.entrance_sound = false
	State.have_crowbar = false
	State.trapdoor_locked = true
	State.living_room_trapdoor = false
	State.trapdoor_no_crowbar = true
	State.trapdoor_with_crowbar = false
	State.gigi_found_in_basement = false
	State.night_4_end = false
	State.day_5_intro = false
	State.night_5_intro = false
	State.hallway_A_electric = false
	State.garage_trigger = false
	State.slot1_empty = true
	State.slot2_empty = true
	State.slot3_empty = true
	State.fuel_cell1 = false
	State.fuel_cell2 = false
	State.fuel_cell3 = false
	State.fuel_cell = 0
	State.mimi_is_here = false
	#var mimi_replace_gigi = false
