extends CharacterBody2D

@export var target: CharacterBody2D
@export var speed: float
@onready var agent := $NavigationAgent2D as NavigationAgent2D

var targeting = true

func _ready():
	add_to_group("GameState")

func IsRayCastEntered():
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Caveman":
		target = body
		retarget()
		targeting = true

func _physics_process(_delta: float) -> void:
	if targeting:
		var direction = to_local(agent.get_next_path_position()).normalized()
		set_velocity() = direction * speed
		print(direction, speed)
		move_and_slide()


func retarget() -> void:
	agent.target_position = target.global_position


func _on_timer_timeout() -> void:
	retarget()
