extends Control

var counter = 1

func _ready() -> void:
	if Global.reset:
		%Talk3.show()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_text_completion_accept") || Input.is_action_pressed("left_click") || Input.is_action_pressed("ui_z"):
		if Global.reset:
			get_tree().quit()
		if counter == 1:
			%Talk1.hide()
			counter += 1
		else:
			%Talk2.hide()
			get_tree().change_scene_to_file('res://main_menu.tscn')
