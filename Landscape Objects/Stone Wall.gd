extends CharacterBody2D

var placed = false

func _ready():
	add_to_group("GameState")
	Place()
func Place():
	while not(placed):
		var mousePosition = get_global_mouse_position()
		var snappedPosition = Vector2(snapped(mousePosition.x, 20), snapped(mousePosition.y, 20))
		position = snappedPosition
		
		if Input.is_action_just_pressed("Click"):
			placed = true
		
