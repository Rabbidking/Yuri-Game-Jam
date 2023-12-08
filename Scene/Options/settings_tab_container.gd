class_name SettingsTabContainer
extends Control

@onready var tab_container: TabContainer = $TabContainer as TabContainer

signal exit_options_menu

func ready():
	$TabContainer/Sound.grab_focus()
func _process(delta):
	options_menu_input()
	if $OptionsBack.is_hovered() or $OptionsBack.has_focus():
		$OptionsBack/Back.add_theme_color_override("font_color", Color(0.57, 0.85, 0.97, 1.0))
	else:
		$OptionsBack/Back.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
	
func change_tab(tab: int) -> void:
	tab_container.set_current_tab(tab)

func options_menu_input() -> void:
	
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("ui_right"):
		if tab_container.current_tab >= tab_container.get_tab_count() - 1:
			change_tab(0)
			return
		var next_tab = tab_container.current_tab + 1
		change_tab(next_tab)
		
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("ui_left"):
		if tab_container.current_tab == 0:
			change_tab(tab_container.get_tab_count() - 1)
		var prev_tab = tab_container.current_tab - 1
		change_tab(prev_tab)
	
	if Input.is_action_just_pressed("ui_cancel"):
		emit_signal("exit_options_menu")



