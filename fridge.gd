extends StaticBody2D

@onready var interactable: Area2D = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact():
	get_tree().change_scene_to_file('res://overworld.tscn')
extends Control

func _ready():
	%Burgers.pressed.connect(burgers)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel") || Input.is_action_pressed("ui_x"):
		get_tree().change_scene_to_file('res://overworld.tscn')

func burgers():
	%Burgers.hide()
