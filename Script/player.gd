extends CharacterBody2D

signal picked_up
signal pick_up_gigi
signal get_in_bed

const SPEED = 300.0

var front_side = false
var back_side = false
var interactable = false
var dont_move = true
var interactable_item = null
var current_object

func _ready():
	print(get_tree().current_scene)
	
func _unhandled_input(event: InputEvent) -> void:
	if dont_move == false:
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
		print(interactable_item)
		State.is_dialog_active = true
		if interactable_item == "gigi":
			#DialogueManager.show_example_dialogue_balloon(load("res://Dialog/main.dialogue"), "key")
			if State.Day == 1:
				DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "living_room")
			State.have_gigi = true
			emit_signal("pick_up_gigi")
			velocity = Vector2(0, 0)
		elif interactable_item == "bed" and State.have_gigi == true:
			emit_signal("get_in_bed")
		elif interactable_item == "key":
			emit_signal("picked_up")
		elif interactable_item == "car" and State.key_taken == true:
			emit_signal("picked_up")
		elif interactable_item == "laptop" and State.password_known == true:
			print("hacker")
			emit_signal("picked_up")
		elif interactable_item == "note":
			emit_signal("picked_up")
			print("read")
		elif interactable_item == "box":
			emit_signal("picked_up")
		elif interactable_item == "receipt":
			emit_signal("picked_up")

		State.is_dialog_active = false
		print(State.is_dialog_active)
	move_and_slide()


func _on_interact_collision_area_entered(area):
	if area.is_in_group("Object"):
		area.pick_up()
		print("hey")

func _on_interact_collision_area_exited(area):
	interactable = false
	interactable_item = null

func _on_gigi_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_note_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_receipt_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_car_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_key_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_laptop_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_bed_pick_up_object(item):
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


func _on_fade_transition_player_can_move():
	dont_move = false
