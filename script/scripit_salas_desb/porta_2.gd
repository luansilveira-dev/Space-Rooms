extends Area2D

onready var tela_escura = get_parent().get_node("tela_escuro")

func _ready():
	$anima_porta.play("abrir")
	tela_escura.play("saindo")
	yield(tela_escura, "animation_finished")


func _on_porta_body_entered(body):
		if body.is_in_group("jogador"):
			tela_escura.play("tela_negra")
			yield(tela_escura, "animation_finished")
			get_tree().change_scene("res://levels_desblo/level_3_3_desblo.tscn")
