extends Control

func _ready():
	%Play.pressed.connect(play)
	%Credits.pressed.connect(credits)
	%Quit.pressed.connect(quit_game)

func play():
	get_tree().change_scene_to_file('res://overworld.tscn')
	
func credits():
	get_tree().change_scene_to_file('res://credits.tscn')

func quit_game():
	get_tree().quit()
