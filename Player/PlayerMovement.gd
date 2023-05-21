extends CharacterBody2D

var motion = Vector2(0,0)

const SPEED = 50

func _ready():
	add_to_group("GameState")

func _physics_process(delta):
	ProcessMovement()
	
func ProcessMovement():
	if Input.is_action_pressed("up"):
		motion.y = -SPEED
	elif Input.is_action_pressed("down"):
		motion.y = SPEED
	else: 
		motion.y = 0
		
	if Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
	else:
		motion.x = 0
		
	set_velocity(motion)
	move_and_slide()
