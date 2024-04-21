tool
extends KinematicBody2D

export var alavamcaII : NodePath
export var alavancaII : NodePath
onready var alavanca_ = get_node(alavancaII)
onready var _alavanca_ = get_node(alavamcaII)



var velocidade := Vector2.ZERO


onready var tela_escura = get_parent().get_parent().get_node("tela_escuro")
onready var anima_inimigo_ = $AnimationPlayer
onready var anima_animationTree = $AnimationTree
onready var animaEstado = anima_animationTree.get("parameters/playback")

var ataque = false
var jogador : KinematicBody2D = null
var path : Array = []
var navigation_path : Navigation2D = null
func _ready(): 
	yield(get_tree(), "idle_frame")
	jogador = get_parent().get_node("jogador")
	navigation_path = get_parent().get_parent().get_node("pathfinding")

func _on_detetor_body_entered(body ):
	if body.is_in_group("jogador"):
		ataque = true
		
func _process(delta):
	if !Engine.editor_hint:
		if jogador and navigation_path:
			generate_path()
			navigate(delta)
		
		velocidade = move_and_slide(velocidade)
		 
func generate_path():
	if jogador != null and navigation_path != null:
		path = navigation_path.get_simple_path(global_position, jogador.global_position, false)
	
func navigate(delta):
	if ataque == true:
		if path.size() > 0:
			velocidade = global_position.direction_to(jogador.global_position) 
			global_position += velocidade * 90 * delta 
			anima_animationTree.set("parameters/Correndo/blend_position", velocidade)
			animaEstado.travel("Correndo")
			if alavanca_.get("alavanca_II") == true or _alavanca_.get("alavanca_II") == true:
				velocidade = global_position.direction_to(jogador.global_position) 
				global_position += velocidade * 2000 * delta 
				$AudioStreamPlayer2D.play()
			if global_position == path[0]:
				path.pop_front()
			
func _on_pegar_jogador_body_entered(body):
	if body.is_in_group("jogador"):
		tela_escura.play("tela_negra")
		yield(tela_escura, "animation_finished")
		get_tree().reload_current_scene()
	   
