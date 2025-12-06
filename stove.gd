extends Control

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		get_tree().change_scene_to_file('res://overworld.tscn')
		
