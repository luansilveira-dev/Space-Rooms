extends StaticBody2D

onready var Ativador = $Ativa_
onready var anima_alavanca = $AnimationAlavanca_
func _process(delta):
	if Input.is_action_just_pressed("space"):
		if Ativador.is_colliding():
			anima_alavanca.play("ativada_")
			yield(anima_alavanca, "animation_finished")
			anima_alavanca.play("desativada_")
		
