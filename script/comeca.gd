extends Control



onready var anima_botao = get_node("AnimationPlayer")
func _on_Button_pressed():
	anima_botao.play("comeca")
	yield(anima_botao,"animation_finished")
	get_tree().change_scene("res://levels/Cutscenes.tscn")

func _on_Button_mouse_entered():
	pass
