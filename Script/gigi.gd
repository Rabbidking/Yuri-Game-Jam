extends Area2D

signal pick_up_object

@export var item : StringName


func _ready():
	if State.collected_items.has(global_position):
		queue_free()
	else:
		State.items.append(global_position)

func pick_up():
	emit_signal("pick_up_object", item)
	
func _on_area_entered(area):
	if area.is_in_group("Interact"):
		if item == "bed" and State.have_gigi == true:
			$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Bed/OBJ_BedA_02.png"))

func _on_area_exited(area):
	if item == "bed" and State.have_gigi == true:
		$Texture.set_texture(load("res://Sprites/Furniture/OBJ_Bed/OBJ_BedA_01.png"))

func _on_player_picked_up_gigi():
	State.have_gigi == true
	queue_free()

func _on_player_get_in_bed():
	get_tree().change_scene_to_file("res://Scene/Rooms/entance.tscn")
