extends Control

var timer := Timer.new()

func _ready() -> void:
	add_child(timer)
	timer.wait_time = 1.0
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		get_tree().change_scene_to_file('res://overworld.tscn')


func _on_timer_timeout():
	print("test")
