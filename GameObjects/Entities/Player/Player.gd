extends KinematicBody2D

onready var joyStick := $MobileControl/JoyStickContainer/JoyStick/Inner

const MOVEMENTSPEED: int = 100

var inputVector: Vector2 = Vector2.ZERO

func _ready():
	joyStick.connect("directionValue", self, "_inputVector")

func _process(delta):
	move_and_slide(inputVector * MOVEMENTSPEED)

func _inputVector(value: Vector2) -> void:
	inputVector = value
