extends Node2D

var itemHeld = "Axe"

func _ready():
	$RayCast2D.set_collide_with_bodies(true)
	add_to_group("GameState")
 
func _process(delta):
	PointAtMouse()
	CheckAttack()
	CheckCollision()

func PointAtMouse():
	var degreeOfRotation = get_local_mouse_position()
	degreeOfRotation = to_global(degreeOfRotation)
	look_at(degreeOfRotation) 
		

func CheckAttack():
	if Input.is_action_just_pressed("Click"):
		get_tree().call_group("GameState", "CheckDestroy", itemHeld)

func CheckCollision():
	if $RayCast2D.is_colliding():
		$RayCast2D.get_collider().IsRayCastEntered()
		
		#get_tree().call_group("GameState", "IsRayCastEntered")

func SetHeldItem(item):
	$RayCast2D/AnimatedSprite2D.animation = item
	itemHeld = item
