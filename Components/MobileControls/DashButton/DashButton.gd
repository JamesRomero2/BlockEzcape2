extends TouchScreenButton

signal dashClicked

var dashAvailable: bool = true

func _on_Timer_timeout():
	dashAvailable = true

func _on_Dash_pressed():
	if dashAvailable:
		emit_signal("dashClicked")
		dashAvailable = false
		$Timer.start()
