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
	
	if State.gigi_at_entrance:
		$doorbell.play()
