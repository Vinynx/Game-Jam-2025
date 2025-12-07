extends Control

func _ready():
	%Back.pressed.connect(back)
	
func back():
	get_tree().change_scene_to_file('res://main_menu.tscn')
