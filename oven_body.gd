extends StaticBody2D

@onready var interactable: Area2D = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.interact = _on_interact
	if Global.last_world_position != Vector2(0, 0):
		%Noelle.position = Global.last_world_position

func _on_interact():
	Global.last_world_position = %Noelle.position
	Global.check = true
	get_tree().change_scene_to_file('res://stove.tscn')
