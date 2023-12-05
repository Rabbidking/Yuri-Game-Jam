extends Node2D

signal hallwayA_pos_1
signal hallwayA_pos_2
signal hallwayA_pos_3

func _ready():
	if State.used_door == true:
		if State.door_used == "hallwayA_1":
			emit_signal("hallwayA_pos_1")
		elif State.door_used == "hallwayA_2":
			emit_signal("hallwayA_pos_2")
		elif State.door_used == "hallwayA_3":
			emit_signal("hallwayA_pos_3")
		$DoorOpen.play()
		
	if State.Day == 2 and State.hallway_A_car == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "hallway_A_car_sound")
		State.hallway_A_car = true
	elif State.Day == 3 and State.hallway_A_doorbell == false:
		$doorbell.play()
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "hallway_A_doorbell")
		State.hallway_A_doorbell = true
	elif State.Day == 5 and State.hallway_A_electric == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "hallway_A_Enter")
		State.hallway_A_electric = true
		
#	if State.gigi_at_entrance:
#		$doorbell.play()		
