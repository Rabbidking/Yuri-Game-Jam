extends Node2D

var gigi = preload("res://Scene/gigi.tscn")

signal living_pos

func _ready():
	if State.used_door == true:
		emit_signal("living_pos")
	if State.Day == 1:
		inst(Vector2(600, 300))
	if State.Day == 3:
		#change the sticky note dialog to Day 3's version.
		
		#I assume checking it beforehand gives a message saying she doesn't need
		#to invade her partner's privacy or something
		pass
	if State.Day >= 4:
		#render the trapdoor here. If it's Day 4 and the trapdoor hasn't been unlocked yet,
		#render it so it's boarded up
		pass
		
func inst(pos):
	var instance = gigi.instantiate()
	instance.position = pos
	add_child(instance)
