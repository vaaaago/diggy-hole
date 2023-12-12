extends CanvasLayer

#var enano = PackedScene
#var gemas = enano.gemas
#var HP = enano.hp
var gemas = 0

func _ready():
	$contarVida.text = String(gemas)



func _process(delta):
	pass
