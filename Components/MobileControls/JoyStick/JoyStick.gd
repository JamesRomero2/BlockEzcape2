extends TouchScreenButton

signal directionValue

var radius: Vector2 = Vector2(16, 16)
var boundary: int = 64
var onGoingDrag : int = -1
var returnAcceleration: int = 10
var threshold: int = 10

func _process(delta) -> void:
	if onGoingDrag == -1:
		var positionDifference: Vector2 = (Vector2.ZERO - radius) - position
		position += positionDifference * returnAcceleration * delta
	
	emit_signal("directionValue", _getValue())

func _input(event) -> void:
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		var eventDistanceFromCenter = (event.position - get_parent().global_position).length()
		
		if eventDistanceFromCenter <= boundary * global_scale.x or event.get_index() == onGoingDrag:
			set_global_position(event.position - radius * global_scale)
			
			if _getButtonPos().length() > boundary:
				set_position(_getButtonPos().normalized() * boundary - radius)
				
			onGoingDrag = event.get_index()

	if event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == onGoingDrag:
		onGoingDrag = -1

func _getButtonPos() -> Vector2:
	return position + radius

func _getValue() -> Vector2:
	if _getButtonPos().length() > threshold:
		return _getButtonPos().normalized()
	return Vector2.ZERO
