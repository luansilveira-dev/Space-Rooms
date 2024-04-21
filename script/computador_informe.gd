extends Area2D

onready var anima_computador = get_node("Animation_computador")
onready var luz = get_node("Light2D")
var validacao = false
func _on_computador_body_entered(body):
	if body.is_in_group("jogador"):
		anima_computador.play("computador_ligado")
		luz.visible = true
		
func _on_computador_body_exited(body):
	if body.is_in_group("jogador"):
		validacao = true
		anima_computador.play("computador_desligador")
		luz.visible = false
