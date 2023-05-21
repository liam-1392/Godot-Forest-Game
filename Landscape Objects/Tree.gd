extends KinematicBody2D

var playerEntered = false

func _ready():
	add_to_group("GameState")

func IsRayCastEntered():
	$Timer.start()
	playerEntered = true
	

func CheckDestroy(item):
	if playerEntered and item == "Axe":
		Destroy()

func Destroy():
	get_tree().call_group("GameState", "AddResource", "Wood", 1)
	queue_free()

func _on_Timer_timeout():
	playerEntered = false
