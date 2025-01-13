extends Node2D

var inventory_sprites = {
	"Berry": load("res://Placeholder Textures/Placeholder Berry.png"),
	"Stone": load("res://Placeholder Textures/Placeholder Rock.png"),
	"Wood": load("res://Placeholder Textures/Placeholder Log.png")
}

var inventory = {
	$Items/Slot1: {"": 0},
	$Items/Slot2: {"": 0},
	$Items/Slot3: {"": 0},
	$Items/Slot4: {"": 0},
	$Items/Slot5: {"": 0},
	$Items/Slot6: {"": 0}
}
var inv_open = false

func _ready() -> void:
	print(get_children())
	AddItem("Berry", 5)
	AddItem("Berry", 5)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(inventory)
	if CheckIfOpeningInventory():
		OpenInventory()

func CheckIfOpeningInventory():
	if Input.is_action_just_pressed("inv"):
		if inv_open == false:
			inv_open = true
		else:
			inv_open = false
		return true

func OpenInventory():
	$Backpack.visible = inv_open

func AddItem(item, type):
	var slot_num = 0
	for slot in inventory.keys():
		print(slot)
		slot = $Items/Slot1
		slot_num += 1
		if inventory[slot].has(item) and typeof(type) == 2: #2 is returned for integer type
			inventory[slot][item] += type
			slot.find_child("Label").text = str(int(slot.find_child("Label").text)+type)
			break
		elif inventory[slot] == { "": 0 }: #Create new item
			inventory[slot] = {item:type}
			#slot.texture = inventory_sprites[item]
			slot.find_child("Label").text = str(type)
			break
			
