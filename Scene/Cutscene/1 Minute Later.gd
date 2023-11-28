extends Node2D


@onready var transition = $Transition
@onready var color_rect = $Transition/ColorRect

func _ready():
	$Transition/Label.text = "1 Minute Later"
	$Transition.play("fade_out")
	$Transition.animation_finished
	$Transition.play("fade_in")
