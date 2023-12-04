extends Node2D

signal bedroom_pos

@onready var later_fade = preload("res://Scene/Cutscene/later_that_night.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("bedroom_pos")
		$DoorOpen.play()
		
	if State.Day == 1 and State.night_1_intro == false:
		$Player.position = Vector2(425, 320)
		$Fade_Transition.visible = false
		var later = later_fade.instantiate()
		add_child(later)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "night_start")
		State.night_1_intro = true
	elif State.Day == 2 and State.night_2_intro == false:
		$Player.position = Vector2(425, 320)
		$Fade_Transition.visible = false
		var later = later_fade.instantiate()
		add_child(later)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "night")
		State.night_2_intro = true
	elif State.Day == 3 and State.night_3_intro == false:
		$Player.position = Vector2(425, 320)
		$Fade_Transition.visible = false
		var later = later_fade.instantiate()
		add_child(later)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "night")
		State.night_3_intro = true
	elif State.Day == 4 and State.night_4_intro == false:
		$Player.position = Vector2(425, 320)
		$Fade_Transition.visible = false
		var later = later_fade.instantiate()
		add_child(later)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "night")
		State.night_4_intro = true
	elif State.Day == 5 and State.night_5_intro == false:
		$Player.position = Vector2(425, 320)
		$Fade_Transition.visible = false
		var later = later_fade.instantiate()
		add_child(later)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "night")
		State.night_5_intro = true
