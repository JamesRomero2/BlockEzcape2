extends TouchScreenButton

onready var buttonTexture := $ButtonTexture

func _setButtonTexture(value):
	buttonTexture.texture = value
