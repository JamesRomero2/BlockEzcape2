extends TouchScreenButton

signal dynamicButtonPressed

onready var buttonTexture := $ButtonTexture

var buttonState: int = 0

var buttonIcons = {
#	Blank Icon
	0: null,
#	Grab Icon
	1: load("res://Assets/Images/GrabIcon.png"),
}

func _setButtonTexture(value: int):
	buttonTexture.texture = buttonIcons[value]
	buttonState = value

func _on_DynamicButton_pressed():
	match buttonState:
		0:
			print("Return")
		1:
			print("Grab")
			emit_signal("dynamicButtonPressed")
