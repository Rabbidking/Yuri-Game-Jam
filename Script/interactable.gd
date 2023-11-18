extends Area2D


signal pick_up_object

@export var item : StringName
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
	elif item == "key":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Key/OBJ_Key_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
	elif item == "car":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_01.png"))
		$CollisionShape2D.scale = Vector2(3.2, 1.5)
		$CollisionShape2D.position = Vector2(0, 20)
	elif item == "laptop":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
		$CollisionShape2D.scale = Vector2(1.5, 1.45)
		$CollisionShape2D.position = Vector2(0, 14)
		if State.ordered_return == true:
			$Texture.visible = false
			$CollisionShape2D.disabled = true
	elif item == "note":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_01.png"))
		$CollisionShape2D.scale = Vector2(0.6, 0.6)
		$CollisionShape2D.position = Vector2(0.62, 0.41)
	elif item == "receipt":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Receipt/OBJ_Receipt_01.png"))
		$CollisionShape2D.scale = Vector2(0.62, -0.79)
		$CollisionShape2D.position = Vector2(0, 1)
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
	elif item == "crowbar":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Crowbar/OBJ_Crowbar_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
	elif item == "teleporter_slot1":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.slot1_empty == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
			$CollisionShape2D.disabled == true
	elif item == "teleporter_slot2":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.slot2_empty == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
			$CollisionShape2D.disabled == true
	elif item == "teleporter_slot3":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
		if State.slot3_empty == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_TeleporterSlot/OBJ_TeleporterSlot_03.png"))
			$CollisionShape2D.disabled == true
	elif item == "fuelcell":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Fuelcell/OBJ_Fuelcell_01.png"))
		$CollisionShape2D.scale = Vector2(1, 1)
		$CollisionShape2D.position = Vector2(0, 0)
				
		
func pick_up():
	emit_signal("pick_up_object", item)
	
func _on_area_entered(area):
	if area.is_in_group("Interact"):
		if item == "bed" and State.have_gigi == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Bed/OBJ_BedA_02.png"))
		elif item == "car" and opened == false:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_02.png"))
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
			if State.trapdoor_locked == false:
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
	elif item == "car" and opened == false:
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_01.png"))
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
		if State.trapdoor_locked == false:
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
	get_tree().change_scene_to_file("res://Scene/Rooms/entrance.tscn")
	State.have_gigi = false
	State.Day += 1

func _on_player_picked_up():
	if item == "key":
		State.key_taken = true
		queue_free()
	elif item == "car" and opened == false:
		opened = true
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_03.png"))
	elif item == "car" and opened == true:
		$CollisionShape2D.disabled = true
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Car/OBJ_Car_01.png"))
		State.have_gigi = true
	elif item == "note":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_01.png"))
		$CollisionShape2D.disabled = true
		State.password_known = true
	elif item == "laptop":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
		$CollisionShape2D.disabled = true
		State.ordered_return = true
	elif item == "box":
		State.have_gigi = true
		State.ordered_return = false
		queue_free()	
	elif item == "receipt":
		$Texture.visible = false
		$CollisionShape2D.disabled = true
		State.read_receipt = true
	elif item == "fuelcell":
		State.fuel_cell += 1
		queue_free()
		

func _on_player_pick_up_gigi():
		if item == "gigi":
			State.have_gigi == true
			queue_free()


func _on_player_picked_up_2():
	if item == "crowbar":
		State.have_crowbar = true
		queue_free()
	elif item == "trapdoor" and State.have_crowbar == true and State.trapdoor_locked == true:
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
		
