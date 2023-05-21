extends KinematicBody2D

var playerEntered = false

func _ready():
	add_to_group("GameState")

func IsRayCastEntered():
	$Timer.start()
	playerEntered = true
	
func CheckDestroy(item):
	if playerEntered:
		Destroy()

func Destroy():
	if $Sprite.frame == 0:
		get_tree().call_group("GameState", "AddResource", "Berry", 1)
		$Sprite.frame = 1
		$RegrowTimer.start()
	
func _on_Timer_timeout():
	playerEntered = false

func _on_RegrowTimer_timeout():
	$Sprite.frame = 0
