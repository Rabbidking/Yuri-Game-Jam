extends Node2D

signal player_can_move

@onready var transition = $Transition
@onready var color_rect = $Transition/ColorRect

func _ready():
	$Transition.play("fade_out")
	$Transition.animation_finished
	$Timer.start()
	$Transition.play("fade_in")



func _on_timer_timeout():
	emit_signal("player_can_move")
