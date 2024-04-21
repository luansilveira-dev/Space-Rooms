extends Area2D

export var porta : NodePath
onready var anima = get_node("anima_botao")
onready var anima_porta = get_node(porta).get_node("anima_porta")

var porta_aberta = false



func _on_body_entered(body):
	if body.is_in_group("caixa"):
		anima_porta.play("abrir")
		anima.play("ligado")
		porta_aberta = true

func _on_body_exited(body):
	if body.is_in_group("caixa"):
		anima_porta.play("fecha")
		anima.play("desligado")
		porta_aberta = false
