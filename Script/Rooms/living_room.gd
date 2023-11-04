extends Node2D

var gigi = preload("res://Scene/gigi.tscn")

signal living_pos

func _ready():
	if State.used_door == true:
		emit_signal("living_pos")
	if State.Day == 1 and get_tree().get_current_scene().name == "living room":
		inst(Vector2(600, 300))
		
func inst(pos):
	var instance = gigi.instantiate()
	instance.position = pos
	add_child(instance)
