extends Node2D

signal entrance_pos_1
signal entrance_pos_2
signal entrance_pos_3

func _ready():
	if State.used_door == true:
		if State.door_used == "entrance":
			emit_signal("entrance_pos_1")
		elif State.door_used == "entrance_1":
			emit_signal("entrance_pos_2")
		elif State.door_used == "entrance_2":
			emit_signal("entrance_pos_3")
	print(State.key_taken)
	if State.key_taken == true:
		print("take")
		$Object.queue_free()

