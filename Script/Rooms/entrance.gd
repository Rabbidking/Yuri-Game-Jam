extends Node2D

signal entrance_pos_1
signal entrance_pos_2
signal entrance_pos_3

#var receipt = preload("res://Scene/object.tscn")
var cutscene_mode = false

func _ready():
#	if State.Day == 3:
		#if State.gigi_at_entrance == false:
	#		# instantiate the receipt here
	#		inst(Vector2(600, 300))
		#else if State.gigi_at_entrance == true:
			#instantiate Gigi here instead
		
	if State.used_door == true:
		if State.door_used == "entrance":
			emit_signal("entrance_pos_1")
		elif State.door_used == "entrance_1":
			emit_signal("entrance_pos_2")
		elif State.door_used == "entrance_2":
			emit_signal("entrance_pos_3")
		$DoorOpen.play()
	
	if State.Day == 4 and State.entrance_sound == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "entrance_sound")
		State.entrance_sound = true

#func inst(pos):
#	var instance = recepit.instantiate()
#	instance.position = pos
#	add_child(instance)
