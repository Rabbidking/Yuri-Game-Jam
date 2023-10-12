extends Node2D

signal room_1_pos
signal room_1_pos_1

# Called when the node enters the scene tree for the first time.
func _ready():
	State.cur_room = 1
	if State.used_door == true:
		if State.door_used == 0:
			emit_signal("room_1_pos")
		elif State.door_used == 3:
			emit_signal("room_1_pos_1")
