extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var animated_sprite = $AnimatedSprite2D

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		get_tree().paused = false
		%TorielLetter.hide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	process_mode = Node.PROCESS_MODE_ALWAYS
	if Global.state == true:
		$Letter.play("opened")

func _on_interact():
	if Global.state == false:
		$Letter.play("open")
		Global.state = true
	%TorielLetter.show()
	get_tree().paused = true
