extends Node2D

signal garage_pos

@onready var gigi_spawn = preload("res://Scene/gigi.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("garage_pos")
	if State.Day == 5 and State.garage_trigger == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "garage_enter_first_time")
		State.garage_trigger = true
