extends KinematicBody2D

export var jogador : NodePath

onready var anima_ = get_node(jogador)
onready var anima_jogador = anima_.get("anima_jogador")
onready var anima_animationTree = anima_.get("anima_animationTree")
onready var animaEstado = anima_.get("animaEstado")

var velocidade = Vector2(0,0)
var movimento = Vector2(0,0)
const VELOCIDADE_LIMITE = 100
const ACELERAR = 90
const ATRITO = 5
# Mover caixa para baixo
onready var baixo = $Mover_caixa_baixo

#Mover caixa para Cima 
onready var cima = $Mover_caixa_cima

#Mover caixa para direita
onready var direita = $Mover_caixa_direita

#Mover Caixa para esquerda 
onready var esquerda = $Mover_caixa_esquerda

func _process(delta):
	if Input.is_action_pressed("space"):
		if baixo.is_colliding() : 
			_movemento_caixa()
			move_and_slide(velocidade)
		if cima.is_colliding() : 
			_movemento_caixa()
			move_and_slide(velocidade)
		if direita.is_colliding(): 
			_movemento_caixa()
			move_and_slide(velocidade)
		if esquerda.is_colliding(): 
			_movemento_caixa()
			move_and_slide(velocidade)
	else : velocidade = movimento.move_toward(Vector2(0,0), ATRITO * delta)
func _movemento_caixa():
	movimento.x = Input.get_action_strength("D") - Input.get_action_strength("A")
	movimento.y = Input.get_action_strength("S") - Input.get_action_strength("W")
	movimento = movimento.normalized()
	if movimento != Vector2(0,0):
		velocidade = movimento.move_toward(movimento * VELOCIDADE_LIMITE, ACELERAR * 1)
		anima_animationTree.set("parameters/empurra/blend_position", movimento)
		animaEstado.travel("empurra")
	else:
		anima_animationTree.set("parameters/Parado/blend_position", movimento)
		animaEstado.travel("Parado")
	
	

	
