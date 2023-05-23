extends Node2D

@export var playerResources = {
	"Wood": 1,
	"Stone": 0, 
	"Berry": 0
}

var resourceOrder = ["Wood"]
var selectedResource = 0

#var stoneWall = preload("res://StoneWall.tscn")


func _ready():
	$AnimatedSprite2D.animation = "Wood"
	add_to_group("GameState")

# warning-ignore:unused_argument
func _process(delta):
	CheckItemSwitch(false)
	SetItemValue()
	CheckIfItemExists()
	

func CheckItemSwitch(switch):
	if Input.is_action_just_pressed("inv up") or switch:
		selectedResource += 1
		
		if selectedResource > (len(resourceOrder) -1):
			selectedResource = 0
			
		SwitchItem()
	if Input.is_action_just_pressed("inv down"):
		selectedResource -= 1

		if selectedResource < 0:
			selectedResource = len(resourceOrder) - 1
			
		SwitchItem()

func SwitchItem():
	var chosenResource = resourceOrder[selectedResource]
	$AnimatedSprite2D.animation = chosenResource
	get_tree().call_group("GameState", "SetHeldItem", chosenResource)

func SetItemValue():
	var chosenResourceQuantity = playerResources[resourceOrder[selectedResource]]
	$Label.text = str(chosenResourceQuantity)

func CheckIfItemExists():
	for item in playerResources.keys():
		if playerResources[item] > 0:
			if not(resourceOrder.has(item)):
				resourceOrder.append(item)
		elif resourceOrder.has(item):
			selectedResource -= 1
			resourceOrder.erase(item)
			if $AnimatedSprite2D.animation == item:
				CheckItemSwitch(true)

func AddResource(item, quantity):
	playerResources[item] += quantity


#func Place():
#	if selectedResource == 0 or selectedResource == 1:
#		if playerResources[resourceOrder[selectedResource]] >= 5:
#			var stoneWallInstance = stoneWall.instance()
#			get_parent().add_child(stoneWallInstance)
