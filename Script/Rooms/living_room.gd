extends Node2D

var gigi = preload("res://Scene/gigi.tscn")


signal living_pos
signal living_pos_1

func _ready():
	if State.used_door == true:
		if State.door_used == "living room":
			emit_signal("living_pos")
		if State.door_used == "living_roomA":
			emit_signal("living_pos_1")
	if State.Day == 1 and State.first_time_found_gigi == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "living_room")
		State.first_time_found_gigi = true
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
