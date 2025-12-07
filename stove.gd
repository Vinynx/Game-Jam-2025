extends Control

var timer := Timer.new()
var tracker = 1
var count = 0
var score = 0
var started = false
var pressed = false

func _ready() -> void:
	add_child(timer)
	timer.wait_time = 0.6
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	%Start.pressed.connect(start)
			
func _physics_process(delta: float) -> void:
	if tracker == 2 && started == true:
		if Input.is_action_just_pressed("ui_accept") && pressed == false:
			score += 1
			pressed = true

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
	pressed = false
	
	if count == 1:
		%Raw1.show()
	if count == 3:
		%Raw1.hide()
		%Raw2.show()
	if count == 5:
		%Raw2.hide()
		%Cooking1.show()
	if count == 7:
		%Cooking1.hide()
		%Cooking2.show()
	if count == 9:
		%Cooking2.hide()
		%Cooked1.show()
	if count == 11:
		%Cooked1.hide()
		%Cooked2.show()
	
	if count/2 > score:
		timer.stop()
		print("fail")
	if count == 12:
		timer.stop()
		print("success")
		%Success.show()
