extends Node2D

const chemin_vers_tuile = "res://prefabs/tuile.tscn"

const START_POS_X = 100
const START_POS_Y = 250
const END_POS_X = 500
const END_POS_Y = 400
const ESPACE = 64

var dinopedia = {"zone1": [Diplodocus, Trex, Triceratops, Ankylosaure, Stegosaure, Velociraptor]}

var dinos = []
var ma_zone = "zone1"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#On choisit les dinos qu'on souhaite récupérer
	# les 3 premiers à 70% -> 50% -> 30%
	for dinosaure in dinopedia.get(ma_zone):
		if(dinos.size() < 3 && randi() % 101 < (dinosaure.rarity - dinos.size() * 20) + 10):
			dinos.append(dinosaure.new())
	if(dinos.size() == 0):
		dinos.append(dinopedia.get(ma_zone).back().new())
	if(dinos.size() == 1):
		pass # add discoin
	for dino in dinos:
		print(dino.class)
	
	# On défini où il y aura des dinos
	for dinosaure in dinos:
		var est_par_desuus = true
		while(est_par_desuus):
			dinosaure.pattern_random()
			est_par_desuus = on_other_fossil(dinosaure)
		
	# Création du plateau
	for y in range(0, 5, 1):
		for x in range(0, 5, 1):
			var tuile = load(chemin_vers_tuile).instantiate()
			tuile.position = Vector2(START_POS_X + (x * ESPACE), START_POS_Y + (y * ESPACE))
			var dino_on_tile = find_if_fossil(Vector2(x, y))
			if(dino_on_tile != null):
				tuile.avoir_fossil = true
				tuile.fond_fossil = dino_on_tile.fond
			add_child(tuile)


# Vérifie qu'il n'y as pas de coordonnée se chevauchant entre le dinosaure données en argument et les autres dinos
func on_other_fossil(dinosaure):
	for dino in dinos:
		if(dino != dinosaure || !dino.pattern_actuel.is_empty()):
			for coord in dinosaure.pattern_actuel:
				if(dino.pattern_actuel.has(coord)):
					return true
	return false

# Vérifie si la coordonnée passé en argument figure dans l'un des dinos, retourne le dino si c'est le cas
func find_if_fossil(coord: Vector2):
	for dino in dinos:
		if(dino.pattern_actuel.has(coord)):
			return dino
	return null
