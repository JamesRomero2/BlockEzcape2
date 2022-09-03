extends KinematicBody2D

onready var joyStick := $MobileControl/JoyStickContainer/JoyStick/Inner
onready var dynamicButton := $MobileControl/Buttons/DynamicButton
onready var dashButton := $MobileControl/Buttons/Dash
onready var raycast := $RayCast2D

const MOVEMENTSPEED: int = 100
const LOOKLENGTH = 15

var inputVector: Vector2 = Vector2.ZERO

func _ready():
	joyStick.connect("directionValue", self, "_inputVector")
	dashButton.connect("dashClicked", self, "_playerDashed")

func _process(delta):
	_raycastRotation(inputVector)
	move_and_slide(inputVector * MOVEMENTSPEED)

func _inputVector(value: Vector2) -> void:
	inputVector = value

func _raycastRotation(vector: Vector2):
	if vector == Vector2.ZERO:
		raycast.set_cast_to(raycast.get_cast_to())
	else:
		raycast.set_cast_to(vector * LOOKLENGTH)

	_raycastCollision()

func _raycastCollision():
	if raycast.is_colliding():
		var objectCollided = raycast.get_collider()
		if objectCollided.is_in_group("Box"):
			dynamicButton._setButtonTexture(1)
			
	else:
		dynamicButton._setButtonTexture(0)

func _playerDashed():
	move_and_slide(inputVector * (MOVEMENTSPEED * 50))
