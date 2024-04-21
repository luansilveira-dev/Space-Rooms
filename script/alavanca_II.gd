extends Sprite

export var inimigo : NodePath
onready var node_inimigo = get_node(inimigo)
onready var anima_alavancaII = $anima_alavancaII
onready var Ativador = $RayCast2D

var alavanca_II = false
func _process(delta):
	if Input.is_action_just_pressed("space"):
			if Ativador.is_colliding():
				anima_alavancaII.play("ativada")
				yield(anima_alavancaII,"animation_finished")
				anima_alavancaII.play("desativada")
				alavanca_II = true
