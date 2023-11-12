extends Node2D

signal garage_pos

@onready var gigi_spawn = preload("res://Scene/gigi.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("garage_pos")
	if State.Day == 2:
		# if Demi interacts with the car before having the key, play the locked out dialog
		pass
