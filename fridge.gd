extends Control

func _ready():
	if Global.reset && Global.letter:
		%BerdlyFreezer.show()
	if Global.burgers == true:
		%Burgers.hide()
	%Burgers.pressed.connect(burgers)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		if Global.reset:
			get_tree().change_scene_to_file('res://startup.tscn')
		else:
			get_tree().change_scene_to_file('res://overworld.tscn')

func burgers():
	%Burgers.hide()
	Global.burgers = true
