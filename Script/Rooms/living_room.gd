extends Node2D

#var gigi = preload("res://Scene/gigi.tscn")
@onready var gigi_spawn = preload("res://Scene/Cutscene/gigi_cutscene.tscn")
@onready var demi_spawn = preload("res://Scene/Cutscene/demi_sit_cutscene.tscn")
@onready var mimi_spawn = preload("res://Scene/Cutscene/mimi_sit_cutscene.tscn")

signal living_pos
signal living_pos_1

func _ready():
	if State.used_door == true:
		if State.door_used == "living room":
			emit_signal("living_pos")
			$DoorOpen.play()
		if State.door_used == "living_roomA":
			emit_signal("living_pos_1")
			$LadderClimb.play()
			
	if State.Day == 1 and State.first_time_found_gigi == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "living_room")
		State.first_time_found_gigi = true
		
	elif State.Day == 4 and State.day_4_intro == false:
		$Player.visible = false
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "morning")
		var demi = demi_spawn.instantiate()
		add_child(demi)
		demi.position = Vector2(535, 142)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(583, 139)
		State.day_4_intro = true
		
	elif State.Day == 5 and State.day_5_intro == false:
		$Player.visible = false
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "morning")
		var demi = demi_spawn.instantiate()
		add_child(demi)
		demi.position = Vector2(535, 142)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(583, 139)
		State.day_5_intro = true
		
	elif State.Day == 5 and State.mimi_is_here == true:
		$Player.visible = false
		State.Day += 1
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "night_end")
		var demi = demi_spawn.instantiate()
		add_child(demi)
		demi.position = Vector2(535, 142)
		var mimi = mimi_spawn.instantiate()
		add_child(mimi)
		mimi.position = Vector2(590, 140)
		
		
#func inst(pos):
#	var instance = gigi.instantiate()
#	instance.position = pos
#	add_child(instance)
