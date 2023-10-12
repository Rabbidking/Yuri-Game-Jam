extends Area2D

signal pick_up_object

var item = "key"

func pick_up():
	emit_signal("pick_up_object", item)
	#queue_free()

func _on_area_entered(area):
	if area.is_in_group("Interact"):
		$Texture.set_texture(load("res://sample/Yellow.png"))


func _on_area_exited(area):
	$Texture.set_texture(load("res://sample/Green.png"))


func _on_player_picked_up_key():
	queue_free()
