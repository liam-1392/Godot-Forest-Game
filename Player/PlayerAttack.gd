extends Node2D

const FIRE_RATE = 3
const BULLET_SPEED = 9

var toolHeld = ""
var can_fire = true
var bullet = preload("res://Player/bullet.tscn")

func _ready():
	$RayCast2D.set_collide_with_bodies(true)
	add_to_group("GameState")
	$Gun.visible = false
 
func _process(delta):
	PointAtMouse()
	CheckAttack()
	CheckCollision()
	SetToolHeld()
	Gun()

func PointAtMouse():
	var degreeOfRotation = get_local_mouse_position()
	degreeOfRotation = to_global(degreeOfRotation)
	look_at(degreeOfRotation) 

func SetToolHeld():
	toolHeld = $"../Tool".toolOrder[$"../Tool".selectedTool]

func CheckAttack():
	if Input.is_action_just_pressed("Click"):
		get_tree().call_group("GameState", "CheckDestroy", toolHeld)

func CheckCollision():
	get_tree().call_group("GameState", "PlayerExit")
	if $RayCast2D.is_colliding():
		$RayCast2D.get_collider().IsRayCastEntered()
		
		#get_tree().call_group("GameState", "IsRayCastEntered")

func Gun():
	if toolHeld == "Gun":
		$Gun.visible = true
		$Sprite2D.visible = false
		
		if Input.is_action_just_pressed("Click"):
			FireBullet()
	else:
		$Gun.visible = false
		$Sprite2D.visible = true
		
func FireBullet():
	if Input.is_action_pressed("Click") and can_fire:
		print("Fired!!")
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = $Gun/BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(BULLET_SPEED, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		await(get_tree().create_timer(FIRE_RATE))
		can_fire = true 
