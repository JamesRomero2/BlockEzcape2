extends TouchScreenButton

signal dashClicked

var dashAvailable: bool = true

func _input(event):
	if (event is InputEventScreenTouch and event.is_pressed()) and dashAvailable:
		emit_signal("dashClicked")
		dashAvailable = false
		$Timer.start()

func _on_Timer_timeout():
	dashAvailable = true
