extends CharacterBody2D


const SPEED = 300.0

@onready var animated_sprite = $AnimatedSprite2D

var facingDirection := "forward"

func _physics_process(delta: float) -> void:
	var facingDirection := "forward"
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xDirection := Input.get_axis("ui_left", "ui_right")
	var yDirection := Input.get_axis("ui_down", "ui_up")
	if xDirection:
		facingDirection = "right"
		velocity.x = xDirection * SPEED
	else:
		facingDirection = "left"
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if yDirection:
		facingDirection = "backward"
		velocity.y = yDirection * SPEED
	else:
		facingDirection = "forward"
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if xDirection == 0 && yDirection == 0:
		if facingDirection == "forward":
			animated_sprite.play("forward_idle")
		if facingDirection == "backward":
			animated_sprite.play("backward_idle")
		if facingDirection == "left":
			animated_sprite.play("left_idle")
		if facingDirection == "right":
			animated_sprite.play("right_idle")
	else:
		if facingDirection == "forward":
			animated_sprite.play("forward_walk")
		if facingDirection == "backward":
			animated_sprite.play("backward_walk")
		if facingDirection == "left":
			animated_sprite.play("left_walk")
		if facingDirection == "right":
			animated_sprite.play("right_walk")

	move_and_slide()
