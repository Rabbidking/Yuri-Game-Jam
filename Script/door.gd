extends Area2D


@export var door_name : StringName
@export var is_locked : bool

func _on_body_entered(body):
	State.used_door = true
	if body.is_in_group("Player"):
		print("human")
		if door_name == "bathroom":
			State.door_used = "bathroom"
			get_tree().change_scene_to_file("res://Scene/Rooms/bathroom.tscn")
		if door_name == "bedroom":
			State.door_used = "bedroom"
			get_tree().change_scene_to_file("res://Scene/Rooms/bedroom.tscn")
		if door_name == "entrance":
			State.door_used = "entrance"
			get_tree().change_scene_to_file("res://Scene/Rooms/entance.tscn")
		if door_name == "entrance_1":
			State.door_used = "entrance_1"
			get_tree().change_scene_to_file("res://Scene/Rooms/entance.tscn")
		if door_name == "entrance_2":
			State.door_used = "entrance_2"
			get_tree().change_scene_to_file("res://Scene/Rooms/entance.tscn")
		if door_name == "garage" and State.key_taken == true:
			State.door_used = "garage"
			get_tree().change_scene_to_file("res://Scene/Rooms/garage.tscn")
		if door_name == "hallwayA_1":
			print("Hall")
			State.door_used = "hallwayA_1"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallwayA.tscn")
		if door_name == "hallwayA_2":
			State.door_used = "hallwayA_2"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallwayA.tscn")
		if door_name == "hallwayA_3":
			State.door_used = "hallwayA_3"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallwayA.tscn")
		if door_name == "hallwayB_1":
			State.door_used = "hallwayB_1"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallway_b.tscn")
		if door_name == "hallwayB_1":
			State.door_used = "hallwayB_1"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallway_b.tscn")
		if door_name == "hallwayB_2":
			State.door_used = "hallwayB_2"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallway_b.tscn")
		if door_name == "hallwayB_3":
			State.door_used = "hallwayB_3"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallway_b.tscn")
		if door_name == "hallwayB_4":
			State.door_used = "hallwayB_4"
			get_tree().change_scene_to_file("res://Scene/Rooms/hallway_b.tscn")
		if door_name == "kitchen":
			State.door_used = "kitchen"
			get_tree().change_scene_to_file("res://Scene/Rooms/kitchen.tscn")
		if door_name == "living room":
			State.door_used = "living room"
			get_tree().change_scene_to_file("res://Scene/Rooms/living_room.tscn")
		if door_name == "study":
			State.door_used = "study"
			get_tree().change_scene_to_file("res://Scene/Rooms/study.tscn")

