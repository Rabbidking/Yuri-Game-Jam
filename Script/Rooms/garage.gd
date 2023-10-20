extends Node2D

signal garage_pos

func _ready():
	if State.used_door == true:
		emit_signal("garage_pos")

