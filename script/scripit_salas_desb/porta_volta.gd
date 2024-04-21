extends Area2D


onready var tela_escura = get_parent().get_node("tela_escuro")

func _on_porta_volta_body_entered(body):
	if body.is_in_group("jogador"):
		tela_escura.play("tela_negra")
		yield(tela_escura, "animation_finished")
		get_tree().change_scene("res://levels_desblo/level_2_desblo.tscn")
