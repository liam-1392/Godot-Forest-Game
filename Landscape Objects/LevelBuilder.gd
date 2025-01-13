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
			var bush_instance = tree.instantiate()
			add_child(bush_instance)
			bush_instance.position = objects.map_to_local(usedCells[i])
			
			
		elif object == 1 :
			var mine_instance = mine.instantiate()
			add_child(mine_instance)
			mine_instance.position = objects.map_to_local(usedCells[i])
			
			
		elif object == 3 :
			var tree_instance = tree.instantiate()
			add_child(tree_instance)
			tree_instance.position = objects.map_to_local(usedCells[i])
			
	objects.clear()
