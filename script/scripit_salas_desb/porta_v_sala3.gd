extends Area2D

onready var computador = get_parent().get_node("YSort/computador")
onready var tela_escura = get_parent().get_node("tela_escuro")
func _ready():
	tela_escura.play("")
	yield(tela_escura, "animation_finished")
func _on_porta_v_sala3_body_entered(body):
	if body.is_in_group("jogador"):
		if computador.get("validacao") == true:
			tela_escura.play("tela_negra")
			yield(tela_escura, "animation_finished")
			get_tree().change_scene("res://levels_desblo/level_3_desblo.tscn")
