extends KinematicBody2D


export var porta : NodePath
onready var porta_ = get_node(porta)


onready var anima_porta = $porta/anima_porta
onready var jogador = $Sprite
onready var anima_colisao = $anima_colisao

var velocidade = Vector2(0,0)
var movimento = Vector2(0,0)

const VELOCIDADE_LIMITE = 400
const ACELERAR = 120
const ATRITO = 5


onready var anima_jogador = $AnimationPlayer
onready var anima_animationTree = $AnimationTree
onready var animaEstado = anima_animationTree.get("parameters/playback")


	
func _process(delta):
	movemento_personagem()
	if movimento != Vector2(0,0):
		direcao_Sprit()
		anima_animationTree.set("parameters/Correndo/blend_position", movimento)
		anima_animationTree.set("parameters/Parado/blend_position", movimento)
		animaEstado.travel("Correndo")
		velocidade = movimento.move_toward(movimento * VELOCIDADE_LIMITE, ACELERAR * 1)
		
	else:
		animaEstado.travel("Parado")
		velocidade = movimento.move_toward(Vector2(0,0), ATRITO * 1)
		
	for detector in get_slide_count():
			var colisao = get_slide_collision(detector)
			if colisao.collider.is_in_group("") or colisao.collider.is_in_group(""):
				animaEstado.travel("Parado")
				velocidade = movimento.move_toward(Vector2(0,0), ATRITO * delta)
	move_and_slide(velocidade)
func direcao_Sprit():
	if Input.is_action_pressed("A"):
		jogador.flip_h = true
		anima_colisao.play("Lado")
	if Input.is_action_pressed("D"):
		jogador.flip_h = false
		anima_colisao.play("Lado")
	elif Input.is_action_pressed("W") : anima_colisao.play("Frente")
	elif Input.is_action_pressed("S") : anima_colisao.play("Frente")
		
func movemento_personagem():
	movimento.x = Input.get_action_strength("D") - Input.get_action_strength("A")
	movimento.y = Input.get_action_strength("S") - Input.get_action_strength("W")
	movimento = movimento.normalized()
