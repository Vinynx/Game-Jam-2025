extends CharacterBody2D


const SPEED = 300.0

@onready var animated_sprite = $AnimatedSprite2D

func get_input():
    var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    velocity = input_direction * SPEED

func _physics_process(delta):
    get_input()
    var move = false

    if Input.is_action_just_released("ui_down"):
        animated_sprite.play("forward_idle")
        move = false
    if Input.is_action_just_released("ui_up"):
        animated_sprite.play("backward_idle")
        move = false
    if Input.is_action_just_released("ui_left"):
        animated_sprite.play("left_idle")
        move = false
    if Input.is_action_just_released("ui_right"):
        animated_sprite.play("right_idle")
        move = false

    if Input.is_action_pressed("ui_down") && move == false:
        animated_sprite.play("forward_walk")
        move = true
    if Input.is_action_pressed("ui_up") && move == false:
        animated_sprite.play("backward_walk")
        move = true
    if Input.is_action_pressed("ui_left") && move == false:
        animated_sprite.play("left_walk")
        move = true
    if Input.is_action_pressed("ui_right") && move == false:
        animated_sprite.play("right_walk")
        move = true

    move_and_slide()
