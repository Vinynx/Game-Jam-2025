extends Control

var timer := Timer.new()
var tracker = 1
var count = 0
var score = 0
var started = false

func _ready() -> void:
	add_child(timer)
	timer.wait_time = 0.6
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	%Start.pressed.connect(start)
			
func _physics_process(delta: float) -> void:
	if tracker == 2 && started == true:
		if Input.is_action_just_pressed("ui_accept"):
			score += 1
		print(score)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		get_tree().change_scene_to_file('res://overworld.tscn')
		
func start():
	timer.start()
	started = true
	%Start.hide()

func _on_timer_timeout():
	if tracker == 1:
		%Indicator.show()
		tracker = 2
	elif tracker == 2:
		%Indicator.hide()
		tracker = 1
	count += 1
	if count == 10:
		timer.stop()
