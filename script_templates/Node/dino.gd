# meta-name: Dino template
# meta-description: Un template pour créer des Dino plus simplement.
extends Node

class_name _CLASS_

const fond = "res://assets/tuile_fossil.png"
var pattern_actuel = []

const zone = 1
const rarity = 1

# (0,0), (1,0), (2,0), (3,0), (4,0),
# (0,1), (1,1), (2,1), (3,1), (4,1),
# (0,2), (1,2), (2,2), (3,2), (4,2),
# (0,3), (1,3), (2,3), (3,3), (4,3),
# (0,4), (1,4), (2,4), (3,4), (4,4),
const starter = []
const pattern = []

func pattern_random():
	var random = [starter.pick_random()]
	for vector in pattern:
		random.append(random.front() + vector)
	pattern_actuel = random
