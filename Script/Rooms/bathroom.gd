extends Node2D

signal bathroom_pos

func _ready():
	if State.used_door == true:
		emit_signal("bathroom_pos")
		$DoorOpen.play()
