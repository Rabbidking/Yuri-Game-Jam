extends Node2D

signal garage_pos
signal gigi_awake

@onready var gigi_spawn = preload("res://Scene/Cutscene/gigi_cutscene.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("garage_pos")
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
