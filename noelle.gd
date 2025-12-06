extends CharacterBody2D


const SPEED = 300.0


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
		facingDirection = "backwards"
		velocity.y = yDirection * SPEED
	else:
		facingDirection = "forward"
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if facingDirection == "forward":
		animated_sprite.play("")

	move_and_slide()
