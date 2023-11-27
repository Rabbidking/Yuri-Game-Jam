extends Node2D

signal kitchen_pos

@onready var gigi_spawn = preload("res://Scene/Cutscene/gigi_cutscene.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("kitchen_pos")
	if State.Day == 2 and State.day_2_intro == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "morning")
		$Player.position = Vector2(555, 333)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(665, 333)
		State.day_2_intro = true
	elif State.Day == 3 and State.day_3_intro == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "morning")
		$Player.position = Vector2(555, 333)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(665, 333)
		State.day_3_intro = true
