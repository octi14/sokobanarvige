extends Node2D
class_name Cinematica

func play_click():
	AudioPlayer.stream = load("res://audio/click.wav")
	AudioPlayer.volume_db = -3
	AudioPlayer.play()

func _ready():
	$tas.velocity.x = 400

func _process(delta):
	if $tas.velocity.x > 0:
		$tas.velocity.x -= 2
	else:
		$Continuar.visible = true
		return
	$tas.velocity = $tas.move_and_slide(Vector2($tas.velocity.x, 0))


func _on_Continuar_pressed():
	play_click()
	global.next_level()
