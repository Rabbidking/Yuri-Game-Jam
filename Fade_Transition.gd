extends Node2D

signal player_can_move

@export var context : StringName
@onready var transition = $Transition
@onready var color_rect = $Transition/ColorRect

func _ready():
	if State.cutscene_playing == false:
		if context == "kitchen":
			$Transition/Label.text = "Kitchen"
		elif context == "living_room":
			$Transition/Label.text = "Living Room"
		elif context == "basement":
			$Transition/Label.text = "Basement"
		elif context == "bathroom":
			$Transition/Label.text = "Bathroom"
		elif context == "bedroom":
			$Transition/Label.text = "Bedroom"
		elif context == "entrance":
			$Transition/Label.text = "Entrance"
		elif context == "garage":
			$Transition/Label.text = "Garage"
		elif context == "hallway_a":
			$Transition/Label.text = "Hallway A"
		elif context == "hallway_b":
			$Transition/Label.text = "Hallway B"
		elif context == "study":
			$Transition/Label.text = "Study"
		$Transition.play("fade_out")
		$Transition.animation_finished
		$Timer.start()
		$Transition.play("fade_in")
	elif State.cutscene_playing == true:
		$Timer.start()
		$Transition.play("nothing")
		$Transition/Label.text = ""



func _on_timer_timeout():
	emit_signal("player_can_move")
