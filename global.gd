extends Node

var currentLevel = "policia"
var next_level = "policia"

func next_scene():
	get_tree().change_scene("res://cinematics/cinematica-"+next_level+".tscn")
	
func next_level():
	get_tree().change_scene("res://levels/"+next_level+".tscn")
