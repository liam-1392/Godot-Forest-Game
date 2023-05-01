extends Node2D

func _ready():
	add_to_group("GameState")
 
func _process(delta):
	PointAtMouse()
	CheckIfSelected()
	CheckCollision()

func PointAtMouse():
	var degreeOfRotation = get_local_mouse_position()
	degreeOfRotation = to_global(degreeOfRotation)
	look_at(degreeOfRotation) 
		

func CheckIfSelected():
	if Input.is_action_just_pressed("Click"):
		get_tree().call_group("GameState", "CheckDestroy")

func CheckCollision():
	if $RayCast2D.is_colliding():
		print($RayCast2D.get_collider())
		$RayCast2D.get_collider().IsRayCastEntered()
