extends Node2D

#var gigi = preload("res://Scene/gigi.tscn")
@onready var gigi_spawn = preload("res://Scene/Cutscene/gigi_cutscene.tscn")

signal living_pos
signal living_pos_1

func _ready():
	if State.used_door == true:
		if State.door_used == "living room":
			emit_signal("living_pos")
		if State.door_used == "living_roomA":
			emit_signal("living_pos_1")
	if State.Day == 1 and State.first_time_found_gigi == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "living_room")
		State.first_time_found_gigi = true
	elif State.Day == 4 and State.day_4_intro == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "morning")
		$Player.position = Vector2(535, 150)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(585, 150)
		State.day_4_intro = true
	elif State.Day == 5 and State.day_5_intro == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "morning")
		$Player.position = Vector2(535, 150)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(585, 150)
		State.day_5_intro = true
		
#func inst(pos):
#	var instance = gigi.instantiate()
#	instance.position = pos
#	add_child(instance)
