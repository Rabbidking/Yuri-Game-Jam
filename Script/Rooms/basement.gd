extends Node2D


signal basement_pos

func _ready():
	if State.used_door == true:
		emit_signal("basement_pos")

