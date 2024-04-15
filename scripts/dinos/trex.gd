extends Node

class_name Trex

const fond = "res://assets/tuile_fossil.png"
var pattern_actuel = []

const zone = 1
const rarity = 3

# (0,0) (1,0) (2,0) (3,0) (4,0)
# (0,1) (1,1) (2,1) (3,1) (4,1)
# (0,2) (1,2) (2,2) (3,2) (4,2)
# (0,3) (1,3) (2,3) (3,3) (4,3) S x x
# (0,4) (1,4) (2,4) (3,4) (4,4)   x
const starter = [Vector2(0,0), Vector2(1,0), Vector2(2,0),
				Vector2(0,1), Vector2(1,1), Vector2(2,1),
				Vector2(0,2), Vector2(1,2), Vector2(2,2),
				Vector2(0,3), Vector2(1,3), Vector2(2,3)]
const pattern = [Vector2(1,0), Vector2(2,0), Vector2(1,1)]

func pattern_random():
	var random = [starter.pick_random()]
	for vector in pattern:
		random.append(random.front() + vector)
	pattern_actuel = random
