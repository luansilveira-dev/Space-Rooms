extends Node2D

onready var tela_escura = get_node("tela_escuro")

func _ready():
	tela_escura.play("saindo")
	yield(tela_escura, "animation_finished")

func _on_Music_finished():
	$Music.play()
