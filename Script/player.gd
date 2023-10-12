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
		if interactable_item == "key":
			print("pick up key")
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

func _on_scene_room_0_pos():
	position = Vector2(534, 100)
func _on_scene_1_room_1_pos():
	position = Vector2(614, 549)
func _on_scene_1_room_1_pos_1():
	position = Vector2(100, 286)
func _on_scene_2_room_2_pos():
	position = Vector2(1000, 290)

