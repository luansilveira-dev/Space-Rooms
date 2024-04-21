extends Area2D


onready var tela_escura = get_parent().get_node("tela_escuro")
func _ready():
	tela_escura.play("saindo")
	yield(tela_escura, "animation_finished")
func _on_Saida_labirinto_body_entered(body):
	if body.is_in_group("jogador"):
		tela_escura.play("tela_negra")
		yield(tela_escura, "animation_finished")
		get_tree().change_scene("res://levels/menu.tscn")
