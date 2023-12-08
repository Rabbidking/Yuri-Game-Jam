extends CharacterBody2D

signal picked_up
signal picked_up2
signal picked_up3
signal picked_up4
signal picked_up5
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
		#Movement
		if Input.is_action_pressed("up"):
			$"Interact Collision/2D Interact Collision".position = Vector2(-64, -64)
			velocity = Vector2(0, -SPEED)
			$AnimatedSprite2D.play("Walk Back")
			front_side = false
			back_side = true
			
		elif Input.is_action_pressed("down"):
			$"Interact Collision/2D Interact Collision".position = Vector2(-64, 64)
			velocity = Vector2(0, SPEED)
			$AnimatedSprite2D.play("Walk Front")
			front_side = true
			back_side = false
			
		elif Input.is_action_pressed("left"):
			$"Interact Collision/2D Interact Collision".position = Vector2(-128,0)
			velocity = Vector2(-SPEED, 0)
			$AnimatedSprite2D.play("Walk Side")
			$AnimatedSprite2D.flip_h = true
			front_side = false
			back_side = false
			
		elif Input.is_action_pressed("right"):
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
				
		#Interact
		if Input.is_action_just_pressed("interact") and interactable == true:
			velocity = Vector2(0, 0)
			print(interactable_item)
			State.is_dialog_active = true
			if interactable_item == "gigi":
			#DialogueManager.show_example_dialogue_balloon(load("res://Dialog/main.dialogue"), "key")
				if State.Day == 1:
					DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "pick_up_gigi")
				if State.Day == 4:
					DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "basement_gigi")
				State.have_gigi = true
				emit_signal("pick_up_gigi")
			elif interactable_item == "bed" and State.have_gigi == true:
				if State.Day == 1:
					DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "bedroom")
				elif State.Day == 2:
					DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "end_night")
				elif State.Day == 3:
					DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "goodnight")
				elif State.Day == 4:
					DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "bedroom")
			elif interactable_item == "key":
				emit_signal("picked_up")
			elif interactable_item == "car":
				emit_signal("picked_up")
			elif interactable_item == "laptop":
				emit_signal("picked_up")
			elif interactable_item == "note":
				emit_signal("picked_up")
			elif interactable_item == "box":
				emit_signal("picked_up")
			elif interactable_item == "receipt":
				emit_signal("picked_up")
			elif interactable_item == "fuelcell":
				emit_signal("picked_up")
			elif interactable_item == "trapdoor":
				emit_signal("picked_up2")
			elif interactable_item == "crowbar":
				emit_signal("picked_up2")
			elif interactable_item == "teleporter_slot1":
				emit_signal("picked_up3")
			elif interactable_item == "teleporter_slot2":
				emit_signal("picked_up4")
			elif interactable_item == "teleporter_slot3":
				emit_signal("picked_up5")

			State.is_dialog_active = false

func _process(delta):
#	if Input.is_action_just_pressed("Interact") and interactable == true:
#		print(interactable_item)
#		State.is_dialog_active = true
#		if interactable_item == "gigi":
#			#DialogueManager.show_example_dialogue_balloon(load("res://Dialog/main.dialogue"), "key")
#			if State.Day == 1:
#				DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "pick_up_gigi")
#			State.have_gigi = true
#			emit_signal("pick_up_gigi")
#			velocity = Vector2(0, 0)
#
#		elif interactable_item == "bed" and State.have_gigi == true:
#			if State.Day == 1:
#				DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_1.dialogue"), "bedroom")
#			#emit_signal("get_in_bed")
#		elif interactable_item == "key":
#			emit_signal("picked_up")
#		elif interactable_item == "car" and State.key_taken == true:
#			emit_signal("picked_up")
#		elif interactable_item == "laptop" and State.password_known == true:
#			emit_signal("picked_up")
#		elif interactable_item == "note":
#			emit_signal("picked_up")
#		elif interactable_item == "box":
#			emit_signal("picked_up")
#		elif interactable_item == "receipt":
#			emit_signal("picked_up")
#		elif interactable_item == "fuelcell":
#			emit_signal("picked_up")
#		elif interactable_item == "trapdoor":
#			emit_signal("picked_up2")
#		elif interactable_item == "crowbar":
#			emit_signal("picked_up2")
#		elif interactable_item == "teleporter_slot1":
#			emit_signal("picked_up3")
#		elif interactable_item == "teleporter_slot2":
#			emit_signal("picked_up4")
#		elif interactable_item == "teleporter_slot3":
#			emit_signal("picked_up5")
#
#		State.is_dialog_active = false
	move_and_slide()


func _on_interact_collision_area_entered(area):
	if area.is_in_group("Object"):
		area.pick_up()

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
func _on_trapdoor_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_crowbar_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_teleporter_slot_1_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_teleporter_slot_2_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_teleporter_slot_3_pick_up_object(item):
	interactable_item = item
	interactable = true
func _on_fuel_cell_pick_up_object(item):
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
func _on_living_room_living_pos_1():
	position = Vector2(854, 237)
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
#Basement
func _on_basement_basement_pos():
	position = Vector2(541, 376)

func _on_fade_transition_player_can_move():
	dont_move = false

