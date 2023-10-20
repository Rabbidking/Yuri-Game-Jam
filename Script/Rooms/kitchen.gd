extends Node2D

signal kitchen_pos

func _ready():
	if State.used_door == true:
		emit_signal("kitchen_pos")
