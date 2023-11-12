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
	elif item == "box":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_CardboardBox/OBJ_CardboardBoxB.png"))
		$CollisionShape2D.scale = Vector2(1.75, -1.05)
		$CollisionShape2D.position = Vector2(0, 8)
		$CollisionShape2D.disabled = true
		$Texture.visible = false
		if State.ordered_return == true:
			$CollisionShape2D.disabled = false
			$Texture.visible = true
	elif item == "laptop":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
		$CollisionShape2D.scale = Vector2(1.5, 1.45)
		$CollisionShape2D.position = Vector2(0, 14)
	elif item == "note":
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_StckyNote/OBJ_StckyNote_01.png"))
		$CollisionShape2D.scale = Vector2(1.5, 1.45)
		$CollisionShape2D.position = Vector2(0.62, 0.41)
		
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


func _on_player_get_in_bed():
	get_tree().change_scene_to_file("res://Scene/Rooms/entance.tscn")
	State.have_gigi = false
	State.Day += 1

func _on_player_picked_up():
	print("print")
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
		print("hacked")
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Laptop/OBJ_Laptop_01.png"))
		$CollisionShape2D.disabled = true
		State.ordered_return = true
	elif item == "box":
		State.have_gigi = true
		State.ordered_return = false
		queue_free()	


func _on_player_pick_up_gigi():
		if item == "gigi":
			State.have_gigi == true
			queue_free()
