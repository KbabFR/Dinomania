extends Button


const fond_fossil = "res://assets/tuile_fossil.png"
const fond_vide = "res://assets/tuile_vide.png"

var avoir_fossil: bool
var etre_presse: bool = false

signal je_suis_presse(avoir_fossil)

# Called when the node enters the scene tree for the first time.
func _ready():
	if(avoir_fossil):
		get_node("Fond").texture = load(fond_fossil)
	else:
		get_node("Fond").texture = load(fond_vide)


func _on_button_down():
	if(!etre_presse):
		get_node("Surface").visible = false
		etre_presse = true
		je_suis_presse.emit(avoir_fossil)
		print(avoir_fossil)
