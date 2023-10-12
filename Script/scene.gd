extends Node2D

signal room_0_pos

func _ready():
	State.cur_room = 0
	if State.used_door == true:
		emit_signal("room_0_pos")
	print(State.key_taken)
	if State.key_taken == true:
		print("take")
		$Object.queue_free()

