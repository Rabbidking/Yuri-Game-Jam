extends Area2D


signal pick_up_object

@export var item : StringName
@export var location : StringName
@export var type : StringName
var opened = false

func _ready():
	if State.collected_items.has(global_position):
		queue_free()
	else:
		State.items.append(global_position)
	
	if item == "bed":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Bed/OBJ_BedA_01.png"))
		$CollisionShape2D.scale = Vector2(2.5, 1)
		$CollisionShape2D.position = Vector2(0, 0)
	if item == "gigi":
		if State.Day == 1 and location == "livingroom" and State.have_gigi != true:
			$AnimatedSprite2D.visible = true
			$CollisionShape2D.disabled = false
		elif State.Day == 4 and location == "basement" and State.have_gigi != true:
			$AnimatedSprite2D.visible = true
			$CollisionShape2D.disabled = false
		else:
			$AnimatedSprite2D.visible = false
			$CollisionShape2D.disabled = true
	elif item == "key":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Key/OBJ_Key_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.Day != 2 or State.key_taken == true:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
	elif item == "car":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_01.png"))
		$CollisionShape2D.scale = Vector2(3.2, 1.5)
		$CollisionShape2D.position = Vector2(0, 20)
		if State.Day != 2:
			$CollisionShape2D.disabled = true
	elif item == "laptop":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
		$CollisionShape2D.scale = Vector2(1.5, 1.45)
		$CollisionShape2D.position = Vector2(0, 14)
		if State.ordered_return == true:
			$Texture.visible = false
			$CollisionShape2D.disabled = true
		if State.Day != 3:
			$CollisionShape2D.disabled = true
	elif item == "note":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_01.png"))
		$CollisionShape2D.scale = Vector2(0.6, 0.6)
		$CollisionShape2D.position = Vector2(0.62, 0.41)
		if State.Day != 3:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
	elif item == "receipt":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Receipt/OBJ_Receipt_01.png"))
		$CollisionShape2D.scale = Vector2(0.62, -0.79)
		$CollisionShape2D.position = Vector2(0, 1)
		if State.Day != 3:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
		if State.read_receipt == true and State.ordered_return == false:
			$Texture.visible = false
			$CollisionShape2D.disabled = true
		elif State.ordered_return == true and State.read_receipt == true:
			item = "box"
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_CardboardBox/OBJ_CardboardBoxB.png"))
			$CollisionShape2D.scale = Vector2(1.75, -1.05)
			$CollisionShape2D.position = Vector2(0, 8)
			$CollisionShape2D.disabled = false
			$Texture.visible = true
	elif item == "trapdoor":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_04.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 39)
		if State.trapdoor_locked == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_01.png"))
			$CollisionShape2D.scale = Vector2(1, 1)
			$CollisionShape2D.position = Vector2(0, 39)
		elif State.Day < 4:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
		elif State.Day > 4:
			State.trapdoor_locked = false
			State.have_crowbar = true
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_01.png"))
			$CollisionShape2D.scale = Vector2(1, 1)
			$CollisionShape2D.position = Vector2(0, 39)
			
	elif item == "crowbar":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Crowbar/OBJ_Crowbar_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.Day == 4 and State.have_crowbar == false:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
		else:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
	elif item == "teleporter_slot1":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.slot1_empty == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
			$CollisionShape2D.disabled == true
		if State.Day == 5:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
		else:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
	elif item == "teleporter_slot2":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.slot2_empty == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
			$CollisionShape2D.disabled == true
		if State.Day == 5:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
		else:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
	elif item == "teleporter_slot3":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.slot3_empty == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
			$CollisionShape2D.disabled == true
		if State.Day == 5:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
		else:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
	elif item == "fuelcell":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Fuelcell/OBJ_Fuelcell_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.Day == 5 and location == "basement" and type == "fuelcell1" and State.fuel_cell1 == false:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
			State.fuel_cell1 = true
		elif State.Day == 5 and location == "kitchen" and type == "fuelcell2" and State.fuel_cell2 == false:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
			State.fuel_cell2 = true
		elif State.Day == 5 and location == "bathroom" and type == "fuelcell3" and State.fuel_cell3 == false:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
			State.fuel_cell3 = true
		else:
			$CollisionShape2D.disabled = true
			$Texture.visible = false
				
		
func pick_up():
	emit_signal("pick_up_object", item)
	
func _on_area_entered(area):
	if area.is_in_group("Interact"):
		if item == "bed" and State.have_gigi == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Bed/OBJ_BedA_02.png"))
		elif item == "car" and opened == false and State.have_gigi == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_02.png"))
		elif item == "car" and opened == true and State.have_gigi == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_04.png"))
		elif item == "key":
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Key/OBJ_Key_02.png"))
		elif item == "laptop":
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_02.png"))
		elif item == "note" and State.password_known == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_02.png"))
		elif item == "receipt":
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Receipt/OBJ_Receipt_02.png"))
		elif item == "trapdoor":
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_05.png"))
			if State.trapdoor_locked == false or State.Day > 4:
				$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_02.png"))
		elif item == "crowbar":
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Crowbar/OBJ_Crowbar_02.png"))
		elif item == "teleporter_slot1" and State.slot1_empty == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_02.png"))
		elif item == "teleporter_slot2" and State.slot2_empty == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_02.png"))
		elif item == "teleporter_slot3" and State.slot3_empty == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_02.png"))
		elif item == "fuelcell":
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Fuelcell/OBJ_Fuelcell_02.png"))

func _on_area_exited(area):
	if item == "bed" and State.have_gigi == true:
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Bed/OBJ_BedA_01.png"))
	elif item == "car" and opened == false and State.have_gigi == false:
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_01.png"))
	elif item == "car" and opened == true and State.have_gigi == false:
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_04.png"))
	elif item == "key":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Key/OBJ_Key_01.png"))
	elif item == "laptop":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
	elif item == "note":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_01.png"))
	elif item == "receipt":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Receipt/OBJ_Receipt_01.png"))
	elif item == "trapdoor":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_04.png"))
		if State.trapdoor_locked == false or State.Day > 4:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_01.png"))
	elif item == "crowbar":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Crowbar/OBJ_Crowbar_01.png"))
	elif item == "teleporter_slot1" and State.slot1_empty == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
	elif item == "teleporter_slot2" and State.slot2_empty == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
	elif item == "teleporter_slot3" and State.slot3_empty == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
	elif item == "fuelcell":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Fuelcell/OBJ_Fuelcell_01.png"))


func _on_player_get_in_bed():
	get_tree().change_scene_to_file("res://Scene/Rooms/bedroom.tscn")
	State.have_gigi = false
	State.Day += 1

func _on_player_picked_up():
	if item == "key":
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "find_key")
		State.key_taken = true
		queue_free()
	elif item == "car" and State.key_taken == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "gigi_in_car")
	elif item == "car" and opened == false and State.key_taken == true:
		opened = true
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_05.png"))
	elif item == "car" and opened == true and State.key_taken == true:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "unlock_car")
		$CollisionShape2D.disabled = true
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_03.png"))
		State.have_gigi = true
	elif item == "note":
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "living_room_sticky")
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_01.png"))
		$CollisionShape2D.disabled = true
		State.password_known = true
	elif item == "laptop" and State.password_known == false:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "bedroom_computer")
	elif item == "laptop" and State.password_known == true:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "bedroom_laptop_2")
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
		$CollisionShape2D.disabled = true
		State.ordered_return = true
	elif item == "box" and opened == false:
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_CardboardBox/OBJ_CardboardBoxB_02.png"))
		opened = true
		State.ordered_return = false
	elif item == "box" and opened == true:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "entrance_night_end")
		State.have_gigi = true
		queue_free()	
	elif item == "receipt":
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "front_entrance_receipt")
		$Texture.visible = false
		$CollisionShape2D.disabled = true
		State.read_receipt = true
	elif item == "fuelcell":
		if State.Day == 5 and location == "basement" and type == "fuelcell1":
			DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "basement_battery")
		elif State.Day == 5 and location == "kitchen" and type == "fuelcell2":
			DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "kitchen_battery")
		elif State.Day == 5 and location == "bathroom" and type == "fuelcell3":
			DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_5.dialogue"), "bathroom_battery")
		State.fuel_cell += 1
		queue_free()
		

func _on_player_pick_up_gigi():
		if item == "gigi":
			State.have_gigi == true
			queue_free()


func _on_player_picked_up_2():
	if item == "crowbar":
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "garage_crowbar_get")
		State.have_crowbar = true
		queue_free()
	elif item == "trapdoor" and State.have_crowbar == false and State.trapdoor_locked == true:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "living_room_basement_discovered")
	elif item == "trapdoor" and State.have_crowbar == true and State.trapdoor_locked == true:
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_4.dialogue"), "basement_open")
		State.trapdoor_locked = false
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TrapFloor/OBJ_TrapFloor_02.png"))
	elif item == "trapdoor" and State.trapdoor_locked == false:
		get_tree().change_scene_to_file("res://Scene/Rooms/basement.tscn")


func _on_player_picked_up_3():
	if item == "teleporter_slot1" and State.fuel_cell > 0 and State.slot1_empty == true:
		State.fuel_cell -= 1
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
		$CollisionShape2D.disabled == true
		State.slot1_empty = false
		if State.slot1_empty == false and State.slot2_empty == false and State.slot3_empty == false:
			print("Functioning")


func _on_player_picked_up_4():
	if item == "teleporter_slot2" and State.fuel_cell > 0 and State.slot2_empty == true:
		State.fuel_cell -= 1
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
		$CollisionShape2D.disabled == true
		State.slot2_empty = false
		if State.slot1_empty == false and State.slot2_empty == false and State.slot3_empty == false:
			print("Functioning")

func _on_player_picked_up_5():
	if item == "teleporter_slot3" and State.fuel_cell > 0 and State.slot3_empty == true:
		State.fuel_cell -= 1
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
		$CollisionShape2D.disabled == true
		State.slot3_empty = false
		if State.slot1_empty == false and State.slot2_empty == false and State.slot3_empty == false:
			print("Functioning")
		
