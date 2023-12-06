extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://Resources/Settings/DefaultSettings.tres")
@onready var keybind_resource : PlayerKeybindResource = preload("res://Resources/Settings/PlayerKeybindDefault.tres")

# Graphics variables
var window_mode_index : int = 0
var resolution_index : int = 0

#Audio variables
var master_vol : float = 0.0
var music_vol : float = 0.0
var sfx_vol : float = 0.0

#settings dictionary for loading
var loaded_data : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	handle_signals()
	create_storage_dictionary()
	
func create_storage_dictionary() -> Dictionary:
	
	var settings_container : Dictionary = {
		"window_mode_index": window_mode_index,
		"resolution_index": resolution_index,
		"master_vol": master_vol,
		"music_vol": music_vol,
		"sfx_vol": sfx_vol,
		"keybinds": create_keybinds_dict()
	}

	return settings_container
	
func create_keybinds_dict() -> Dictionary:
	var keybinds_container = {
		keybind_resource.LEFT : keybind_resource.left_key,
		keybind_resource.RIGHT : keybind_resource.right_key,
		keybind_resource.UP : keybind_resource.up_key,
		keybind_resource.DOWN : keybind_resource.down_key,
		keybind_resource.INTERACT : keybind_resource.interact_key,
		keybind_resource.PAUSE : keybind_resource.pause_key
	}
	return keybinds_container

# GETTERS
func get_window_mode_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index
	
func get_resolution_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_RESOLUTION_INDEX
	return resolution_index
	
func get_master_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOL
	return master_vol
	
func get_music_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOL
	return music_vol
	
func get_sfx_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SFX_VOL
	return sfx_vol
	
func get_keybind(action: String):
	if !loaded_data.has("keybinds"):
		match action:
			keybind_resource.LEFT:
				return keybind_resource.DEFAULT_LEFT_KEY
			
			keybind_resource.RIGHT:
				return keybind_resource.DEFAULT_RIGHT_KEY
			
			keybind_resource.UP:
				return keybind_resource.DEFAULT_UP_KEY
			
			keybind_resource.DOWN:
				return keybind_resource.DEFAULT_DOWN_KEY
			
			keybind_resource.INTERACT:
				return keybind_resource.DEFAULT_INTERACT_KEY
			
			keybind_resource.PAUSE:
				return keybind_resource.DEFAULT_PAUSE_KEY
	
	else:
		match action:
			keybind_resource.LEFT:
				return keybind_resource.left_key
			
			keybind_resource.RIGHT:
				return keybind_resource.right_key
			
			keybind_resource.UP:
				return keybind_resource.up_key
			
			keybind_resource.DOWN:
				return keybind_resource.down_key
			
			keybind_resource.INTERACT:
				return keybind_resource.interact_key
			
			keybind_resource.PAUSE:
				return keybind_resource.pause_key

# ================================================================================

# SETTERS
func on_window_mode_selected(index: int) -> void:
	window_mode_index = index
	
func on_resolution_selected(index: int) -> void:
	resolution_index = index
	
func on_master_sound_set(value: float) -> void:
	master_vol = value
	
func on_music_sound_set(value: float) -> void:
	music_vol = value
	
func on_sfx_sound_set(value: float) -> void:
	sfx_vol = value
	
func set_keybind(action: String, event) -> void:
	match action:
		keybind_resource.LEFT:
			keybind_resource.left_key = event
			
		keybind_resource.RIGHT:
			keybind_resource.right_key = event
			
		keybind_resource.UP:
			keybind_resource.up_key = event
			
		keybind_resource.DOWN:
			keybind_resource.down_key = event
			
		keybind_resource.INTERACT:
			keybind_resource.interact_key = event
			
		keybind_resource.PAUSE:
			keybind_resource.pause_key = event

	
func on_keybinds_loaded(data: Dictionary) -> void:
	var loaded_left = InputEventKey.new()
	var loaded_right = InputEventKey.new()
	var loaded_up = InputEventKey.new()
	var loaded_down = InputEventKey.new()
	var loaded_interact = InputEventKey.new()
	var loaded_pause = InputEventKey.new()
	
	#grab physical keycodes
	loaded_left.set_physical_keycode(int(data.left))
	loaded_right.set_physical_keycode(int(data.right))
	loaded_up.set_physical_keycode(int(data.up))
	loaded_down.set_physical_keycode(int(data.down))
	loaded_interact.set_physical_keycode(int(data.interact))
	loaded_pause.set_physical_keycode(int(data.pause))
	
	#access keys
	keybind_resource.left_key = loaded_left
	keybind_resource.right_key = loaded_right
	keybind_resource.up_key = loaded_up
	keybind_resource.down_key = loaded_down
	keybind_resource.interact_key = loaded_interact
	keybind_resource.pause_key= loaded_pause
	
func on_settings_data_loaded(data: Dictionary) -> void:
	loaded_data = data
	
	#setter functions for setting variables in settings
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resolution_index)
	on_master_sound_set(loaded_data.master_vol)
	on_music_sound_set(loaded_data.music_vol)
	on_sfx_sound_set(loaded_data.sfx_vol)
	on_keybinds_loaded(loaded_data.keybinds)

	
func handle_signals() -> void:
	SettingsSignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SettingsSignalBus.on_resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_sound_set.connect(on_master_sound_set)
	SettingsSignalBus.on_music_sound_set.connect(on_music_sound_set)
	SettingsSignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
