extends Sprite

onready var anima_ = get_node("AnimationPlayer")
func _ready():
	anima_.play("anima_cutscene")
	yield(anima_,"animation_finished")
	get_tree().change_scene("res://levels/level_1.tscn")
