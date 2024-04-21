extends Area2D

onready var chave = get_node("chave_de_entrada/caixa_Input")

export var botao : NodePath
onready var botao_ = get_node(botao)

onready var tela_escura = get_parent().get_node("tela_escuro")
func _on_porta_body_entered(body):
	if botao_.get("porta_aberta") == true:
		tela_escura.play("tela_negra")
		yield(tela_escura, "animation_finished")
		get_tree().change_scene("res://levels/level_2.tscn")
		



