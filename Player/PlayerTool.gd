extends Node2D

@export var playerTools = {
	"Axe": "",
	"Pickaxe": "",
	"Gun": ""
}

var toolOrder = ["Axe", "Pickaxe", "Gun"]
var selectedTool = 0

#var stoneWall = preload("res://StoneWall.tscn")


func _ready():
	add_to_group("GameState")

# warning-ignore:unused_argument
func _process(delta):
	CheckToolSwitch()
	CheckIfToolExists()

func CheckToolSwitch():
	if Input.is_action_just_pressed("tool up"):
		selectedTool += 1
		
		if selectedTool > (len(toolOrder) -1):
			selectedTool = 0
			
		SwitchTool()
	if Input.is_action_just_pressed("tool down"):
		selectedTool -= 1

		if selectedTool < 0:
			selectedTool = len(toolOrder) - 1
			
		SwitchTool()

func SwitchTool():
	var chosenTool = toolOrder[selectedTool]
	$AnimatedSprite2D.animation = chosenTool
	get_tree().call_group("GameState", "SetHeldTool", chosenTool)

func CheckIfToolExists():
	for tool in playerTools.keys():
		if playerTools[tool] == "":
			if not(toolOrder.has(tool)):
				toolOrder.append(tool)
		elif toolOrder.has(tool):
			selectedTool -= 1
			toolOrder.remove(tool)




#func Place():
#	if selectedResource == 0 or selectedResource == 1:
#		if playerResources[resourceOrder[selectedResource]] >= 5:
#			var stoneWallInstance = stoneWall.instance()
#			get_parent().add_child(stoneWallInstance)
