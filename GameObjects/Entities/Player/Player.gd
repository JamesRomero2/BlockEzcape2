extends KinematicBody2D

onready var joyStick := $MobileControl/JoyStickContainer/JoyStick/Inner
onready var buttonTexture := $MobileControl/Buttons/DynamicButton
onready var raycast := $RayCast2D

const MOVEMENTSPEED: int = 100
const LOOKLENGTH = 15

var inputVector: Vector2 = Vector2.ZERO

func _ready():
	joyStick.connect("directionValue", self, "_inputVector")

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
			var texture = ImageTexture.new()
			var image = Image.new()
			image.load("res://Assets/Images/GrabIcon.png")
			texture.create_from_image(image)
			buttonTexture._setButtonTexture(texture)
	else:
		buttonTexture._setButtonTexture(null)
