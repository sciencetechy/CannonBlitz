extends Node2D

var gamestart = false

func _process(_delta):
	if Input.is_action_just_pressed("Gamestart"):
		get_tree().change_scene_to_file("res://Scenes/Player.tscn")

