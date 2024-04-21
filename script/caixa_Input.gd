extends CanvasLayer


var chave = null
var acesso = false
const CHAR_READ_ROTE = 0.05
onready var caixaConteiner = $caixa_Conteiner
onready var start = $caixa_Conteiner/MarginContainer/HBoxContainer/start
onready var end = $caixa_Conteiner/MarginContainer/HBoxContainer/end
onready var label = $caixa_Conteiner/MarginContainer/HBoxContainer/Label

var senha = null
var senha_coparacao = 2022

onready var finished = $finished
enum State{
	READY,
	READING,
	FINISHED
}

var corrent_state = State.READY
var text_queue = []
func _ready():
	chave = get_node("caixa_Conteiner/MarginContainer/HBoxContainer/MarginContainer/chave")
	_Text()
	queue_text(" Digite a senha...")

func _process(delta):
	if Input.is_action_just_pressed("1"):
		chave.set_text(chave.get_text() + "1")
	if Input.is_action_just_pressed("2"):
		chave.set_text(chave.get_text() + "2")
	if Input.is_action_just_pressed("3"):
		chave.set_text(chave.get_text() + "3")
	if Input.is_action_just_pressed("4"):
		chave.set_text(chave.get_text() + "4")
	if Input.is_action_just_pressed("5"):
		chave.set_text(chave.get_text() + "5")
	if Input.is_action_just_pressed("6"):
		chave.set_text(chave.get_text() + "6")
	if Input.is_action_just_pressed("7"):
		chave.set_text(chave.get_text() + "7")
	if Input.is_action_just_pressed("8"):
		chave.set_text(chave.get_text() + "8")
	if Input.is_action_just_pressed("9"):
		chave.set_text(chave.get_text() + "9")
	if Input.is_action_just_pressed("0"):
		chave.set_text(chave.get_text() + "0")
		
	if Input.is_action_just_pressed("apagar"):
		var text = []
		for i in chave.get_text():
			text.append(i)
		text.remove(text.size() - 1)
		chave.set_text("")
		for i in text:
			chave.set_text(chave.get_text() + i)
	if Input.is_action_just_pressed("space"):
		cadeado_chave()
	match corrent_state:
		State.READY:
			if !text_queue.empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("space"):
				label.percent_visible = 1.0
				$Tween.stop_all()
				end.text = "-" 
				change_state(State.FINISHED)
				finished.stop()
		State.FINISHED:
			if Input.is_action_just_pressed("space"):
				finished.play()
				change_state(State.READY)
				_Text()
func queue_text(next_text):
	text_queue.push_back(next_text)
	
func _Text():
	start.text = "_"
	end.text = "_"
	label.text = ""
	caixaConteiner.hide()
	
func start_caixaTexto():
	start.text = "-"
	caixaConteiner.show()
	
func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.percent_visible = 0.5
	change_state(State.READING)
	start_caixaTexto()
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_ROTE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	
func _on_Tween_tween_all_completed():
	end.text = "_"
	change_state(State.FINISHED)
	
func change_state(next_stete):
	corrent_state = next_stete
	match corrent_state:
		State.READY:
			pass
		State.READING:
			pass
		State.FINISHED:
			pass

func cadeado_chave():
	if senha == null:
		senha = float(chave.get_text())
	if senha == senha_coparacao:
		acesso = true
		print("ACESSO LIBERADO ", acesso)
		
	else:
		queue_text("ACESSO NEGADO")
		senha = null
		


