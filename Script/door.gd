extends Area2D


@export var door_name : StringName
@export var is_locked : bool
@export var door_type : StringName

func _ready():
	if door_type == "front":
		$Sprite2D.visible = true
		$Sprite2D.position = Vector2(-7, 3)
		$Sprite2D.scale = Vector2(-0.73, -1.17)
		$"Door Sprite".texture = load("res://Sprites/Furniture/OBJ_Door/OBJ_DoorB.png")
		$"Door Sprite".position = Vector2(-9, -8)
		$"Door Collision".position = Vector2(-9, -30)
	elif door_type == "side_right":
		$Sprite2D.visible = false
		$"Door Sprite".texture = load("res://Sprites/Furniture/OBJ_Door/OBJ_DoorD.png")
		$"Door Sprite".position = Vector2(-7, -8)
		$"Door Collision".position = Vector2(30, 2)
		$"Door Sprite".flip_h = false
	elif door_type == "side_left":
		$Sprite2D.visible = false
		$"Door Sprite".texture = load("res://Sprites/Furniture/OBJ_Door/OBJ_DoorD.png")
		$"Door Sprite".position = Vector2(-7, -8)
		$"Door Collision".position = Vector2(-45, 2)
		$"Door Sprite".flip_h = true
	elif door_type == "back":
		$Sprite2D.visible = true
		$Sprite2D.position = Vector2(-7, 3)
		$Sprite2D.scale = Vector2(-0.73, -1.17)
		$"Door Sprite".texture = load("res://Sprites/Furniture/OBJ_Door/OBJ_DoorC.png")
		$"Door Sprite".position = Vector2(-9, -8)
		$"Door Collision".position = Vector2(-9, 40)
	elif door_type == "basement":
		$"Door Sprite".texture = load("res://Sprites/Furniture/OBJ_Ladder/OBJ_Ladder.png")
		$"Door Sprite".position = Vector2(-9, -8)
		$"Door Collision".position = Vector2(-9, 40)
	else:
		$"Door Sprite".texture = load("res://Sprites/Furniture/OBJ_Door/OBJ_DoorA.png")

func _on_body_entered(body):
	State.used_door = true
	if body.is_in_group("Player"):
		if door_name == "bathroom":
			State.door_used = "bathroom"
			get_tree().change_scene_to_file("res://Scene/Rooms/bathroom.tscn")
		if door_name == "bedroom":
			State.door_used = "bedroom"
			get_tree().change_scene_to_file("res://Scene/Rooms/bedroom.tscn")
		if door_name == "entrance":
			State.door_used = "entrance"
			get_tree().change_scene_to_file("res://Scene/Rooms/entrance.tscn")
		if door_name == "entrance_1":
			State.door_used = "entrance_1"
			get_tree().change_scene_to_file("res://Scene/Rooms/entrance.tscn")
		if door_name == "entrance_2":
			State.door_used = "entrance_2"
			get_tree().change_scene_to_file("res://Scene/Rooms/entrance.tscn")
		if door_name == "garage":
			State.door_used = "garage"
			get_tree().change_scene_to_file("res://Scene/Rooms/garage.tscn")
		if door_name == "hallwayA_1":
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
		if door_name == "living_roomA":
			State.door_used = "living_roomA"
			get_tree().change_scene_to_file("res://Scene/Rooms/living_room.tscn")	

