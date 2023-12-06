extends Node2D

signal kitchen_pos

@onready var gigi_spawn = preload("res://Scene/Cutscene/gigi_sit_cutscene.tscn")
@onready var demi_spawn = preload("res://Scene/Cutscene/demi_sit_cutscene.tscn")
@onready var next_fade = preload("res://Scene/Cutscene/next_day.tscn")

func _ready():
	if State.used_door == true:
		emit_signal("kitchen_pos")
		$DoorOpen.play()
	if State.Day == 2 and State.day_2_intro == false:
		$Prop/ObjWindowD.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowD2.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowF.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowF2.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Player.visible = false
		var next_day = next_fade.instantiate()
		add_child(next_day)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_2.dialogue"), "morning")
		var demi = demi_spawn.instantiate()
		add_child(demi)
		demi.position = Vector2(562, 323)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(607, 294)
		State.day_2_intro = true
	elif State.Day == 3 and State.day_3_intro == false:
		$Prop/ObjWindowD.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowD2.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowF.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowF2.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Player.visible = false
		var next_day = next_fade.instantiate()
		add_child(next_day)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/Day_3.dialogue"), "morning")
		var demi = demi_spawn.instantiate()
		add_child(demi)
		demi.position = Vector2(562, 323)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(607, 294)
		State.day_3_intro = true
	elif State.Day == 6:
		$Prop/ObjWindowD.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowD2.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowF.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		$Prop/ObjWindowF2.set_texture(load("res://Sprites/Furniture/OBJ_Window/OBJ_WindowC.png"))
		State.Day += 1
		$Player.visible = false
		var next_day = next_fade.instantiate()
		add_child(next_day)
		DialogueManager.show_dialogue_balloon(load("res://Dialog/ending.dialogue"), "ending")
		var demi = demi_spawn.instantiate()
		add_child(demi)
		demi.position = Vector2(562, 323)
		var gigi = gigi_spawn.instantiate()
		add_child(gigi)
		gigi.position = Vector2(607, 294)
