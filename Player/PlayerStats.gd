extends VBoxContainer

var itemHeld = ""

var playerHealth = 100
var playerHunger = 100

func _ready():
	add_to_group("GameState")
	$HungerBar/HungerTimer.start()

func _process(delta):
	CheckItemUse()
	SetItemHeld()

func SetItemHeld():
	itemHeld = $"../Inventory".resourceOrder[$"../Inventory".selectedResource]

func CheckItemUse():
	if Input.is_action_just_pressed("Click"):
		if itemHeld == "Berry":
			playerHunger += 10
		
			if playerHunger > 100:
				playerHunger = 100
			
			UpdateHungerBar()
			get_tree().call_group("GameState", "AddResource", "Berry", -1)

func UpdateHealthBar():
	$HealthBar/Label.text = str(playerHealth)

func UpdateHungerBar():
	$HungerBar/Label.text = str(playerHunger)

func _on_HungerTimer_timeout():
	if playerHunger > 0:
		playerHunger -= 1
		UpdateHungerBar()
	else:
		playerHealth -= 1
		if playerHealth <= 0:
			get_tree().change_scene_to_file("res://DeathScreen.tscn")
		UpdateHealthBar()
	
	$HungerBar/HungerTimer.start()
	
