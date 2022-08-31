extends TouchScreenButton

onready var buttonTexture := $ButtonTexture

var buttonIcons = {
#	Blank Icon
	0: null,
#	Grab Icon
	1: load("res://Assets/Images/GrabIcon.png"),
}

func _setButtonTexture(value: int):
	buttonTexture.texture = buttonIcons[value]
