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
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_up"):
		$"Interact Collision/2D Interact Collision".position = Vector2(-64, -64)
		velocity = Vector2(0, -SPEED)
		print("up")
		
	elif Input.is_action_pressed("ui_down"):
		$"Interact Collision/2D Interact Collision".position = Vector2(-64, 64)
		velocity = Vector2(0, SPEED)
		print("down")
		
	elif Input.is_action_pressed("ui_left"):
		$"Interact Collision/2D Interact Collision".position = Vector2(-128,0)
		velocity = Vector2(-SPEED, 0)
		print("left")
		
	elif Input.is_action_pressed("ui_right"):
		$"Interact Collision/2D Interact Collision".position = Vector2(0, 0)
		velocity = Vector2(SPEED, 0)
		print("right")
		
	else: 
		velocity = Vector2(0, 0)
			

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
