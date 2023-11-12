extends Node2D

signal study_pos

func _ready():
	if State.used_door == true:
		emit_signal("study_pos")
