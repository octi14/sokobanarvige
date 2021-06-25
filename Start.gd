extends Node2D

func _on_Button_pressed():
	global.next_scene()

func _on_Button2_pressed():
	get_tree().quit()
