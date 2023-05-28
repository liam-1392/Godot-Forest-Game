extends CharacterBody2D

var playerEntered = false

func _ready():
	add_to_group("GameState")

func IsRayCastEntered():
	playerEntered = true
	
func PlayerExit():
	playerEntered = false

func CheckDestroy(item):
	print(playerEntered,item)
	if playerEntered and item == "Axe":
		Destroy()
		print(playerEntered)

func Destroy():
	get_tree().call_group("GameState", "AddResource", "Wood", 1)
	queue_free()

