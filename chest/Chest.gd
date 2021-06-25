extends Area2D

signal pressed
signal unpressed


func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D):
	if not body is Coin:
		return
	emit_signal("pressed")
	$sprite.play("closed")
	AudioPlayer.stream = load("res://audio/candado.wav")
	AudioPlayer.play()
	
	
func _on_body_exited(body: PhysicsBody2D):
	if not body is Coin:
		return
	emit_signal("unpressed")
