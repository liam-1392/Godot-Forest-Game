extends Node2D

var playerEntered = false
@export var drop = ""
@export var quantity = 0

func _ready():
	add_to_group("GameState")

func CheckDestroy():
	if playerEntered:
		print("clicked")
		print("destroyed")
		queue_free()

func IsRayCastEntered():
	$Timer.start()
	playerEntered = true

func _on_Timer_timeout():
	playerEntered = false
