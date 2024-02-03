extends Node2D

@onready var objects = $Objects

@onready var tree = load("res://Landscape Objects/Tree.tscn")
@onready var mine = load("res://Landscape Objects/Mine.tscn")
@onready var bush = load("res://Landscape Objects/Berry Bush.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func addObjects():
	
	var usedCells = objects.get_used_cells()
	print(usedCells)
	
	for i in usedCells.size():
		
		var object = objects.get_cellv(usedCells[i])
		print(object)
		if object == 0 :
			var bush_instance = tree.instance()
			add_child(bush_instance)
			bush_instance.position = objects.map_to_world(usedCells[i])
			
			
		elif object == 1 :
			var mine_instance = mine.instance()
			add_child(mine_instance)
			mine_instance.add_to_group("Coins")
			mine_instance.position = objects.map_to_world(usedCells[i])
			
			
		elif object == 3 :
			var smile_instance = tree.instance()
			add_child(smile_instance)
			tree_instance.add_to_group("Balloons")
			tree_instance.position = objects.map_to_world(usedCells[i])
			
	objects.clear()
