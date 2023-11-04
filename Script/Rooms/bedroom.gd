extends Node2D

signal bedroom_pos

func _ready():
	if State.used_door == true:
		emit_signal("bedroom_pos")
	if State.Day == 2:
		#play the car key dialog after Gigi is in trunk
		pass
