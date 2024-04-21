extends Node2D


func _ready():
	pass


func _on_Music_finished():
	$Music.play()
