extends CharacterBody2D

signal picked_up_key

const SPEED = 300.0

var front_side = false
var back_side = false
var interactable = false
var interactable_item = null
var current_object

func _ready():
	print(get_tree().current_scene)
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_up"):
		$"Interact Collision/2D Interact Collision".position = Vector2(-64, -64)
		velocity = Vector2(0, -SPEED)
		$AnimatedSprite2D.play("Walk Back")
		front_side = false
		back_side = true
		
	elif Input.is_action_pressed("ui_down"):
		$"Interact Collision/2D Interact Collision".position = Vector2(-64, 64)
		velocity = Vector2(0, SPEED)
		$AnimatedSprite2D.play("Walk Front")
		front_side = true
		back_side = false
		
	elif Input.is_action_pressed("ui_left"):
		$"Interact Collision/2D Interact Collision".position = Vector2(-128,0)
		velocity = Vector2(-SPEED, 0)
		$AnimatedSprite2D.play("Walk Side")
		$AnimatedSprite2D.flip_h = true
		front_side = false
		back_side = false
		
	elif Input.is_action_pressed("ui_right"):
		$"Interact Collision/2D Interact Collision".position = Vector2(0, 0)
		velocity = Vector2(SPEED, 0)
		$AnimatedSprite2D.play("Walk Side")
		$AnimatedSprite2D.flip_h = false
		front_side = false
		back_side = false
		
	else: 
		velocity = Vector2(0, 0)
		if front_side == true:
			$AnimatedSprite2D.play("Idle Front")
		elif back_side == true:
			$AnimatedSprite2D.play("Idle Back")
		else:
			$AnimatedSprite2D.play("Idle Side")
			

func _process(delta):
	if Input.is_action_just_pressed("Interact") and interactable == true:
		State.is_dialog_active = true
		if interactable_item == "key":
			DialogueManager.show_example_dialogue_balloon(load("res://Dialog/main.dialogue"), "key")
			State.key_taken = true
			emit_signal("picked_up_key")
			velocity = Vector2(0, 0)
		State.is_dialog_active = false
		print(State.is_dialog_active)
	move_and_slide()


func _on_interact_collision_area_entered(area):
	if area.is_in_group("Object"):
		area.pick_up()

func _on_interact_collision_area_exited(area):
	interactable = false
	interactable_item = null

func _on_object_pick_up_object(item):
	interactable_item = item
	interactable = true

#Entrance
func _on_entrance_entrance_pos_1():
	position = Vector2(576, 115)
func _on_entrance_entrance_pos_2():
	position = Vector2(490, 350)
func _on_entrance_entrance_pos_3():
	position = Vector2(660, 350)
#Hallway_A
func _on_hallway_a_hallway_a_pos_1():
	position = Vector2(536, 456)
func _on_hallway_a_hallway_a_pos_2():
	position = Vector2(568, 288)
func _on_hallway_a_hallway_a_pos_3():
	position = Vector2(536, 200)
#Garage
func _on_garage_garage_pos():
	position = Vector2(206, 280)
#Living Room
func _on_living_room_living_pos():
	position = Vector2(296, 324)
#Kitchen
func _on_kitchen_kitchen_pos():
	position = Vector2(777, 332)
#Hallway B
func _on_hallway_b_hallway_b_pos_1():
	position = Vector2(853, 331)
func _on_hallway_b_hallway_b_pos_2():
	position = Vector2(284, 328)
func _on_hallway_b_hallway_b_pos_3():
	position = Vector2(284, 232)
func _on_hallway_b_hallway_b_pos_4():
	position = Vector2(551, 232)
#Bedrooom
func _on_bedroom_bedroom_pos():
	position = Vector2(760, 192)
#Study
func _on_study_study_pos():
	position = Vector2(481, 355)
#Bathroom
func _on_bathroom_bathroom_pos():
	position = Vector2(552, 397)
