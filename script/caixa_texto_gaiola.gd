extends CanvasLayer

var op_text = false
const CHAR_READ_ROTE = 0.05
onready var caixaConteiner = $caixa_Conteiner
onready var start = $caixa_Conteiner/MarginContainer/HBoxContainer/start
onready var end = $caixa_Conteiner/MarginContainer/HBoxContainer/end
onready var label = $caixa_Conteiner/MarginContainer/HBoxContainer/Label

onready var finished = $finished

enum State{
	READY,
	READING,
	FINISHED
}

var corrent_state = State.READY
var text_queue = []


func _on_detector_body_entered(body):
	_Text()
	queue_text("...")
	
func _process(delta):
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
	
