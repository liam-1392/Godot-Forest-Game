extends CharacterBody2D

var playerEntered = false

func _ready():
	add_to_group("GameState")

func IsRayCastEntered():
	$Timer.start()
	playerEntered = true
	
func CheckDestroy(item):
	if playerEntered and item == "Pickaxe":
		Destroy()

func Destroy():
	get_tree().call_group("GameState", "AddResource", "Stone", 2)
	queue_free()

func _on_Timer_timeout():
	playerEntered = false

