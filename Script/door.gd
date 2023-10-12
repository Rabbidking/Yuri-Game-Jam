extends Area2D


@export var door_number : int
@export var is_locked : bool

func _on_body_entered(body):
	State.used_door = true
	if body.is_in_group("Player"):
		if door_number == 0:
			State.door_used = 0
			get_tree().change_scene_to_file("res://Scene/scene_1.tscn")
		if door_number == 1:
			State.door_used = 1
			get_tree().change_scene_to_file("res://Scene/scene.tscn")
		if door_number == 2 and State.key_taken == true:
			State.door_used = 2
			get_tree().change_scene_to_file("res://Scene/scene_2.tscn")
		if door_number == 3:
			State.door_used = 3
			get_tree().change_scene_to_file("res://Scene/scene_1.tscn")
