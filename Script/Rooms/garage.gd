extends Node2D

signal garage_pos
signal gigi_awake

@onready var gigi_spawn = preload("res://Scene/Cutscene/gigi_cutscene.tscn")
@onready var gigi_sleep_spawn = preload("res://Scene/Cutscene/gigi_sleep_cutscene.tscn")
@onready var mimi_spawn = preload("res://Scene/Cutscene/mimi_cutscene.tscn")
@onready var flash = preload("res://Scene/Cutscene/flash.tscn")
@onready var minute = preload("res://Scene/Cutscene/1_minute_later.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("garage_pos")
	if State.Day != 5:
		$Props/Teleporter.visible = false
		$"Object Collision/teleporter".disabled = true
	if State.Day == 1 and State.day_1_intro == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "afternoon")
		$Player.position = Vector2(480, 295)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(550, 295)
		State.day_1_intro = true
		
	elif State.Day == 5 and State.garage_trigger == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "garage_enter_first_time")
		State.garage_trigger = true
	elif State.Day == 5 and State.slot1_empty == false and State.slot2_empty == false and State.slot3_empty == false and State.mimi_is_here == false:
		$Fade_Transition.visible = false
		var minute_later = minute.instantiate()
		add_child(minute_later)
		$Props/Teleporter/Portal.visible = true
		$Player.position = Vector2(305, 265)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "teleporter_place_batteries")
	elif State.Day == 5 and State.mimi_is_here == true:
		$Fade_Transition.visible = false
		$Props/Teleporter/Portal.visible = true
		$Player.position = Vector2(305, 265)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "teleporter_flash")
		spawn_them()

func spawn_them():
	var flashing = flash.instantiate()
	add_child(flashing)
	var gigi_sleep = gigi_sleep_spawn.instantiate()
	add_child(gigi_sleep)
	gigi_sleep.position = Vector2(475, 260)
	var mimi = mimi_spawn.instantiate()
	add_child(mimi)
	mimi.position = Vector2(420, 260)
