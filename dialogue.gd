extends Control

var counter = 1

func _ready() -> void:
	if Global.first == false:
		%MainTalk1.hide()

func _input(event: InputEvent) -> void:
	if Global.first == true && (Input.is_action_pressed("ui_text_completion_accept") || Input.is_action_pressed("left_click") || Input.is_action_pressed("ui_z")):
		if counter == 1:
			%MainTalk1.hide()
			Global.first = false
			counter += 1
			
func _physics_process(delta: float) -> void:
	if Global.bell:
		%TextList4.hide()
		%TextList5.show()
	elif Global.success:
		%TextList3.hide()
		%TextList4.show()
	elif Global.burgers:
		%TextList2.hide()
		%TextList3.show()
	elif Global.letter:
		%TextList1.hide()
		%TextList2.show()
	if Global.success:
		%Berdly.hide()
