extends Node2D

signal room_2_pos

func _ready():
	State.cur_room = 2
	if State.used_door == true:
		emit_signal("room_2_pos")

