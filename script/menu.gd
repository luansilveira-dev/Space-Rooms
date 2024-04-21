extends AnimatedSprite


func _ready():
	pass


func _on_Music_finished():
	$Music.play()
