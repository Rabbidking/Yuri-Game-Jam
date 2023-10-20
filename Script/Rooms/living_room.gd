extends Node2D


signal living_pos

func _ready():
	if State.used_door == true:
		emit_signal("living_pos")

