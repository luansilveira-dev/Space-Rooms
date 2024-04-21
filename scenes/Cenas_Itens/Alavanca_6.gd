extends Sprite


export var porta : NodePath
onready var anima = get_node("anima_botao")
onready var anima_porta = get_node(porta).get_node("anima_porta")

onready var anima_lavanca6 = $anima_alavanca6
onready var Ativador = $RayCast2D
var alavanca_6 = false

func _process(delta):
	if Input.is_action_just_pressed("space"):
		if Ativador.is_colliding():
			anima_lavanca6.play("ligada")
			yield(anima_lavanca6,"animation_finished")
			anima_lavanca6.play("desligada")
			alavanca_6 = true
			_ready()
func _ready():
	if alavanca_6 == true:
		anima_porta.play("abrir")
