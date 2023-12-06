extends CanvasLayer


@onready var balloon: TextureRect = %Balloon

@onready var left_portrait: TextureRect = %LeftPortrait
@onready var right_portrait: TextureRect = %RightPortrait
@onready var left_nameplate: TextureRect = %LeftNameplate
@onready var right_nameplate: TextureRect = %RightNameplate
@onready var left_character_label: Label = %LeftCharacterLabel
@onready var right_character_label: Label = %RightCharacterLabel
@onready var indicator: TextureRect = $Balloon/Indicator
@onready var talk_sound: AudioStreamPlayer = $TalkSound

@onready var dialogue_label: DialogueLabel = %DialogueLabel
@onready var responses_menu: DialogueResponsesMenu = %ResponsesMenu

## The dialogue resource
var resource: DialogueResource

## Temporary game states
var temporary_game_states: Array = []

## See if we are waiting for the player
var is_waiting_for_input: bool = false:
	set(value):
		is_waiting_for_input = value
		indicator.visible = value
	get:
		return is_waiting_for_input

## See if we are running a long mutation and should hide the balloon
var will_hide_balloon: bool = false

var left_portrait_path: String = ""
var right_portrait_path: String = ""

## The current line
var dialogue_line: DialogueLine:
	set(next_dialogue_line):
		is_waiting_for_input = false

		# The dialogue has finished so close the balloon
		if not next_dialogue_line:
			queue_free()
			return

		dialogue_line = next_dialogue_line
		
		# Check if only one character is active in the dialogue. If so, hide RightPortrait and its children.
		# Demi should usually be the only person on the left frame. If she has to jump to the other frame,
		# flip the portrait. Same with Gigi and Mimi.
		
		#===========================================================================================
		left_portrait_path = "res://Sprites/Portraits/Demi %s.png" % dialogue_line.get_tag_value("demi")
		left_character_label.visible = dialogue_line.character.begins_with("Demi")
		left_character_label.text = tr(dialogue_line.character, "dialogue")
		left_nameplate.visible = not dialogue_line.character.is_empty()
		right_portrait.texture = null
		right_character_label.text = ""
		
		if dialogue_line.character.is_empty():
			left_nameplate.visible = not dialogue_line.character.is_empty()
			right_nameplate.visible = not dialogue_line.character.is_empty()
			
		if dialogue_line.character.begins_with("Demi"):
			left_portrait.modulate = Color(1, 1, 1)
			right_portrait.modulate = Color(0.5, 0.5, 0.5)
		
		
			
		if dialogue_line.character.begins_with("Gigi"):
			right_portrait.modulate = Color(1, 1, 1)
			right_portrait_path = "res://Sprites/Portraits/Gigi %s.png" % dialogue_line.get_tag_value("gigi")
			right_character_label.visible = dialogue_line.character.begins_with("Gigi")
			right_character_label.text = tr(dialogue_line.character, "dialogue")
			right_nameplate.visible = not dialogue_line.character.is_empty()
			
			left_character_label.text = ""
			left_portrait_path = "res://Sprites/Portraits/Demi Default.png"
			left_portrait.modulate = Color(0.5, 0.5, 0.5)
			
		
		if dialogue_line.character.begins_with("Mimi"):
			right_portrait.modulate = Color(1, 1, 1)
			right_portrait_path = "res://Sprites/Portraits/Mimi %s.png" % dialogue_line.get_tag_value("mimi")
			right_character_label.visible = dialogue_line.character.begins_with("Mimi")
			right_character_label.text = tr(dialogue_line.character, "dialogue")
			right_nameplate.visible = not dialogue_line.character.is_empty()
			
			left_character_label.text = ""
			left_portrait_path = "res://Sprites/Portraits/Demi Default.png"
			left_portrait.modulate = Color(0.5, 0.5, 0.5)
			
			
		
		if ResourceLoader.exists(left_portrait_path) or ResourceLoader.exists(right_portrait_path):
			left_portrait.texture = load(left_portrait_path)
			right_portrait.texture = load(right_portrait_path)
		else:
			left_portrait.texture = null
			right_portrait.texture = null
			
#		if ResourceLoader.exists(right_portrait_path):
#			right_portrait.texture = load(right_portrait_path)
#		else:
#			right_portrait.texture = null
#		left_character_label.visible = dialogue_line.character.begins_with("Demi")
#		left_character_label.text = tr(dialogue_line.character, "dialogue")
#		left_nameplate.visible = not dialogue_line.character.is_empty()
#
#		if State.mimi_replace_gigi == false:
#			right_character_label.visible = dialogue_line.character.begins_with("Gigi")
#		else:
#			right_character_label.visible = dialogue_line.character.begins_with("Mimi")
#
#		right_nameplate.visible = not dialogue_line.character.is_empty()
#		right_character_label.text = tr(dialogue_line.character, "dialogue")
#
#		var left_portrait_path: String = "res://Sprites/Portraits/Demi %s.png" % dialogue_line.get_tag_value("demi")
#		if ResourceLoader.exists(left_portrait_path):
#			left_portrait.texture = load(left_portrait_path)
#		else:
#			left_portrait.texture = null
#
#		if State.mimi_replace_gigi == false:
#			right_portrait_path = "res://Sprites/Portraits/Gigi %s.png" % dialogue_line.get_tag_value("gigi")
#		else:
#			right_portrait_path = "res://Sprites/Portraits/Mimi %s.png" % dialogue_line.get_tag_value("mimi")
#		if ResourceLoader.exists(right_portrait_path):
#			right_portrait.texture = load(right_portrait_path)
#		else:
#			right_portrait.texture = null
			
		#===========================================================================================

		dialogue_label.hide()
		dialogue_label.dialogue_line = dialogue_line

		responses_menu.hide()
		responses_menu.set_responses(dialogue_line.responses)

		# Show our balloon
		balloon.show()
		will_hide_balloon = false

		dialogue_label.show()
		if not dialogue_line.text.is_empty():
			dialogue_label.type_out()
			await dialogue_label.finished_typing

		# Wait for input
		if dialogue_line.responses.size() > 0:
			balloon.focus_mode = Control.FOCUS_NONE
			responses_menu.show()
		elif dialogue_line.time != "":
			var time = dialogue_line.text.length() * 0.02 if dialogue_line.time == "auto" else dialogue_line.time.to_float()
			await get_tree().create_timer(time).timeout
			next(dialogue_line.next_id)
		else:
			is_waiting_for_input = true
			balloon.focus_mode = Control.FOCUS_ALL
			balloon.grab_focus()
	get:
		return dialogue_line


func _ready() -> void:
	balloon.hide()
	indicator.hide()
	Engine.get_singleton("DialogueManager").mutated.connect(_on_mutated)
	

func _unhandled_input(_event: InputEvent) -> void:
	# Only the balloon is allowed to handle input while it's showing
	get_viewport().set_input_as_handled()


## Start some dialogue
func start(dialogue_resource: DialogueResource, title: String, extra_game_states: Array = []) -> void:
	temporary_game_states =  [self] + extra_game_states
	is_waiting_for_input = false
	resource = dialogue_resource
	self.dialogue_line = await resource.get_next_dialogue_line(title, temporary_game_states)


## Go to the next line
func next(next_id: String) -> void:
	self.dialogue_line = await resource.get_next_dialogue_line(next_id, temporary_game_states)


### Signals


func _on_mutated(_mutation: Dictionary) -> void:
	is_waiting_for_input = false
	will_hide_balloon = true
	get_tree().create_timer(0.1).timeout.connect(func():
		if will_hide_balloon:
			will_hide_balloon = false
			balloon.hide()
	)


func _on_balloon_gui_input(event: InputEvent) -> void:
	# If the user clicks on the balloon while it's typing then skip typing
	if dialogue_label.is_typing and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		get_viewport().set_input_as_handled()
		dialogue_label.skip_typing()
		return

	if not is_waiting_for_input: return
	if dialogue_line.responses.size() > 0: return

	# When there are no response options the balloon itself is the clickable thing
	get_viewport().set_input_as_handled()

	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		next(dialogue_line.next_id)
	elif event.is_action_pressed("ui_accept") and get_viewport().gui_get_focus_owner() == balloon:
		next(dialogue_line.next_id)


func _on_responses_menu_response_selected(response: DialogueResponse) -> void:
	next(response.next_id)


func _on_dialogue_label_spoke(letter, letter_index, speed) -> void:
	if not dialogue_line.character.is_empty() and not letter in [".", " "]:
		talk_sound.pitch_scale = randf_range(0.9, 1.1)
		talk_sound.play()
