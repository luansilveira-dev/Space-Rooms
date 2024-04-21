extends Area2D

export var alavanca6 : NodePath
onready var alavanca6_ = get_node(alavanca6)

onready var tela_escura = get_parent().get_node("tela_escuro")
func _on_porta_body_entered(body):
	if alavanca6_.get("alavanca_6") == true:
	
		tela_escura.play("tela_negra")
		yield(tela_escura, "animation_finished")
		get_tree().change_scene("res://levels/level_4.tscn")
	
