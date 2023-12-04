extends Node2D

signal hallwayB_pos_1
signal hallwayB_pos_2
signal hallwayB_pos_3
signal hallwayB_pos_4

func _ready():
	if State.used_door == true:
		if State.door_used == "hallwayB_1":
			emit_signal("hallwayB_pos_1")
		elif State.door_used == "hallwayB_2":
			emit_signal("hallwayB_pos_2")
		elif State.door_used == "hallwayB_3":
			emit_signal("hallwayB_pos_3")
		elif State.door_used == "hallwayB_4":
			emit_signal("hallwayB_pos_4")
		$DoorOpen.play()
