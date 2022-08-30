extends KinematicBody2D

onready var areaDetection = $AreaDetection

func _on_AreaDetection_body_entered(body):
	if body.name == "Player":
#		Player Entered Handle
		pass
