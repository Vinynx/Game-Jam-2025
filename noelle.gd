extends CharacterBody2D


const SPEED = 300.0

@onready var animated_sprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED

func _physics_process(delta):
	get_input()
	var move = false
	var facing = "down"

	if Input.is_action_just_released("ui_down"):
		animated_sprite.play("forward_idle")
		move = false
		Global.facing = "down"
	if Input.is_action_just_released("ui_up"):
		animated_sprite.play("backward_idle")
		move = false
		Global.facing = "up"
	if Input.is_action_just_released("ui_left"):
		animated_sprite.play("left_idle")
		move = false
		Global.facing = "left"
	if Input.is_action_just_released("ui_right"):
		animated_sprite.play("right_idle")
		move = false
		Global.facing = "right"

	if Input.is_action_pressed("ui_down") && move == false:
		animated_sprite.play("forward_walk")
		move = true
		Global.facing = "down"
	if Input.is_action_pressed("ui_up") && move == false:
		animated_sprite.play("backward_walk")
		move = true
		Global.facing = "up"
	if Input.is_action_pressed("ui_left") && move == false:
		animated_sprite.play("left_walk")
		move = true
		Global.facing = "left"
	if Input.is_action_pressed("ui_right") && move == false:
		animated_sprite.play("right_walk")
		move = true
		Global.facing = "right"
		
	if Global.check == true:
		if Global.facing == "down":
			animated_sprite.play("forward_idle")
			Global.check = false
		if Global.facing == "up":
			animated_sprite.play("backward_idle")
			Global.check = false
		if Global.facing == "left":
			animated_sprite.play("left_idle")
			Global.check = false
		if Global.facing == "right":
			animated_sprite.play("right_idle")
			Global.check = false

	move_and_slide()
