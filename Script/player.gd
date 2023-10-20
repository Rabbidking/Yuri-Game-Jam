extends CharacterBody2D

signal picked_up_key

const SPEED = 300.0

var key_buffer1 = false
var key_buffer2 = false
var key_buffer3 = false
var key_buffer4 = false
var interactable = false
var interactable_item = null
var current_object

func _ready():
	print(get_tree().current_scene)
	
func _process(delta):
	if Input.is_action_just_pressed("Interact") and interactable == true:
		State.is_dialog_active = true
		print(State.is_dialog_active)
		if interactable_item == "key":
			print("pick up key")
			DialogueManager.show_example_dialogue_balloon(load("res://Dialog/main.dialogue"), "key")
			State.is_dialog_active = false
			State.key_taken = true
			emit_signal("picked_up_key")
	if Input.is_action_pressed("ui_up") and key_buffer2 == false and key_buffer3 == false and key_buffer4 == false:
		velocity.y = -SPEED
		velocity.x = 0
		key_buffer1 = true
	elif Input.is_action_pressed("ui_down") and key_buffer1 == false and key_buffer3 == false and key_buffer4 == false:
		velocity.y = SPEED
		velocity.x = 0
		key_buffer2 = true
	elif Input.is_action_pressed("ui_left")and key_buffer1 == false and key_buffer2 == false and key_buffer4 == false:
		velocity.x = -SPEED
		velocity.y = 0
		key_buffer3 = true
	elif Input.is_action_pressed("ui_right")and key_buffer1 == false and key_buffer2 == false and key_buffer3 == false:
		velocity.x = SPEED
		velocity.y = 0
		key_buffer4 = true
	elif Input.is_action_just_released("ui_up"):
		key_buffer1 = false
	elif Input.is_action_just_released("ui_down"):
		key_buffer2 = false
	elif Input.is_action_just_released("ui_left"):
		key_buffer3 = false
	elif Input.is_action_just_released("ui_right"):
		key_buffer4 = false
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()


func _on_interact_collision_area_entered(area):
	if area.is_in_group("Object"):
		area.pick_up()

func _on_interact_collision_area_exited(area):
	interactable = false
	interactable_item = null

func _on_object_pick_up_object(item):
	interactable_item = item
	print(interactable_item)
	interactable = true


func _on_entrance_entrance_pos_1():
	position = Vector2(534, 100)
func _on_entrance_entrance_pos_2():
	position = Vector2(100, 314)
func _on_entrance_entrance_pos_3():
	position = Vector2(1000, 314)
func _on_hallway_a_hallway_a_pos_1():
	position = Vector2(614, 549)
func _on_hallway_a_hallway_a_pos_2():
	position = Vector2(1000, 290)
func _on_hallway_a_hallway_a_pos_3():
	position = Vector2(614, 100)
func _on_garage_garage_pos():
	position = Vector2(100, 290)
func _on_living_room_living_pos():
	position = Vector2(100, 314)
func _on_kitchen_kitchen_pos():
	position = Vector2(1000, 314)





func _on_hallway_b_hallway_b_pos_1():
	position = Vector2(614, 500)


func _on_hallway_b_hallway_b_pos_2():
	position = Vector2(45, 500)


func _on_hallway_b_hallway_b_pos_3():
	position = Vector2(45, 100)


func _on_hallway_b_hallway_b_pos_4():
	position = Vector2(315, 100)


func _on_bedroom_bedroom_pos():
	position = Vector2(1085, 150)


func _on_study_study_pos():
	position = Vector2(70, 500)


func _on_bathroom_bathroom_pos():
	position = Vector2(285, 500)
