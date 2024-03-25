extends Node2D

const chemin_vers_tuile = "res://prefabs/tuile.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	for y in range(180, 500, 64):
		for x in range(80, 400, 64):
			var tuile = load(chemin_vers_tuile).instantiate()
			tuile.avoir_fossil = (randi() % 2) == 0
			tuile.position = Vector2(x, y)
			add_child(tuile)
			
	
