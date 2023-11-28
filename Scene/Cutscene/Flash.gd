extends Node2D


@onready var transition = $Transition
@onready var color_rect = $Transition/ColorRect

func _ready():
	$Transition/Label.text = "I'm Here Demi."
	$Transition.play("fade_out")
	$Transition.animation_finished
	$Transition.play("fade_in")
