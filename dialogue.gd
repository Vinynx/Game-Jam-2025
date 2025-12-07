extends Control

var counter = 1

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_text_completion_accept") || Input.is_action_pressed("left_click") || Input.is_action_pressed("ui_z"):
		if counter == 1:
			%MainTalk1.hide()
			counter += 1
