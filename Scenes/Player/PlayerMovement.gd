extends KinematicBody2D

var motion = Vector2()
var speedCoefficient = 1

const SPEED = 75

func _ready():
	add_to_group("GameState")

func _physics_process(delta):
	ProcessMovement()

func ProcessMovement():
	if Input.is_action_pressed("sprint"):
		speedCoefficient = 2
	else: 
		speedCoefficient = 1
	
	if Input.is_action_pressed("up"):
		motion.y = -SPEED * speedCoefficient
	elif Input.is_action_pressed("down"):
		motion.y = SPEED * speedCoefficient
	else: 
		motion.y = 0
		
	if Input.is_action_pressed("left"):
		motion.x = -SPEED * speedCoefficient
	elif Input.is_action_pressed("right"):
		motion.x = SPEED * speedCoefficient
	else:
		motion.x = 0
		
	move_and_slide(motion)


