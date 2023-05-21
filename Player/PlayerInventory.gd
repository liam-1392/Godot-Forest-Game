extends Node2D

@export var playerResources = {
	"Wood": 1,
	"Stone": 0, 
	"Berry": 0,
	"Axe": 0,
	"Pickaxe": 0
}

var resourceOrder = ["Wood"]
var selectedResource = 0

#var stoneWall = preload("res://StoneWall.tscn")


func _ready():
	add_to_group("GameState")

# warning-ignore:unused_argument
func _process(delta):
	CheckItemSwitch()
	SwitchItem()
	SetItemValue()
	CheckIfItemExists()
	#print(resourceOrder)
	#if Input.is_action_just_pressed("place"):
	#	Place()
	

func CheckItemSwitch():
	if Input.is_action_just_pressed("inv up"):
		selectedResource += 1
		if selectedResource > (len(resourceOrder) -1):
			selectedResource = 0
	if Input.is_action_just_pressed("inv down"):
		selectedResource -= 1
		if selectedResource < 0:
			selectedResource = len(resourceOrder) - 1

func SwitchItem():
	var chosenResource = resourceOrder[selectedResource]
	$AnimatedSprite2D.animation = chosenResource
	get_tree().call_group("GameState", "SetHeldItem", chosenResource)

func SetItemValue():
	var chosenResourceQuantity = playerResources[resourceOrder[selectedResource]]
	$Label.text = str(chosenResourceQuantity)

func CheckIfItemExists():
	for item in playerResources.keys():
		if typeof(playerResources[item]) != 4:
			if playerResources[item]:
				if !resourceOrder.has(item):
					resourceOrder.append(item)
			elif resourceOrder.has(item):
				selectedResource -= 1
				resourceOrder.remove(item)

func AddResource(item, quantity):
	playerResources[item] += quantity


#func Place():
#	if selectedResource == 0 or selectedResource == 1:
#		if playerResources[resourceOrder[selectedResource]] >= 5:
#			var stoneWallInstance = stoneWall.instance()
#			get_parent().add_child(stoneWallInstance)
