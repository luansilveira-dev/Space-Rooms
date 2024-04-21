extends StaticBody2D
 
export var porta : NodePath
onready var anima = get_node("anima_botao")
onready var anima_porta = get_node(porta).get_node("anima_porta")

export var triangolo : NodePath
onready var anima_tiangolo = get_node(triangolo)
onready var Ativador = $Ativa_
onready var anima_alavanca = $AnimationAlavanca_

var alavanca = false
func _process(delta):
	if Input.is_action_just_pressed("space"):
		if Ativador.is_colliding():
			anima_alavanca.play("ativada_")
			yield(anima_alavanca, "animation_finished")
			anima_alavanca.play("desativada_")
			print("Ativado")
			alavanca = true
			_ready()
			
func _ready():
	if alavanca == true and get_tree().current_scene.name == "level_2":
			anima_tiangolo.play("mover_")
			yield(anima_tiangolo, "animation_finished")
			anima_porta.play("abrir")
