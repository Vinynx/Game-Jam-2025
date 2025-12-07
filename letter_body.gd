extends StaticBody2D

@onready var interactable: Area2D = $Interactable

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		%TorielLetter.hide()
		%MysteryLetter.hide()
		if Global.state || Global.reset:
			get_tree().paused = false
			Global.state = true
			Global.letter = true
		if Global.state == false && get_tree().paused && Global.reset == false:
			get_tree().paused = false
			%FireMagic.play("fire")
			%Noelle.animated_sprite.play("shock")
			%Noelle.position += Vector2(-120, 0)
			Global.state = true
			Global.letter = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	process_mode = Node.PROCESS_MODE_ALWAYS
	if Global.state == true:
		$Letter.play("opened")

func _on_interact():
	if Global.reset:
		if Global.state == false:
			$Letter.play("open")
		%MysteryLetter.show()
	else:
		if Global.state == false:
			$Letter.play("open")
		%TorielLetter.show()
	get_tree().paused = true


func _on_animation_finished() -> void:
	%Noelle.animated_sprite.play("right_idle")
