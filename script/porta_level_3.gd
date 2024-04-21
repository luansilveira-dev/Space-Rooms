extends Area2D

export var alavanca : NodePath
onready var alavanca_ = get_node(alavanca)

onready var tela_escura = get_parent().get_node("tela_escuro")

func _on_porta_body_entered(body):
	if alavanca_.get("alavanca") == true:
		tela_escura.play("tela_negra")
		yield(tela_escura, "animation_finished")
		get_tree().change_scene("res://levels/level_3.tscn")
