extends Node2D

var t = 1

func _process(_delta):
	if $"../Label".upgrade == false:
		position.y = 34848
	else:
		position.y = 80
		
	if Input.is_action_just_pressed("left"):
		if t == 1:
			t = 2
		else:
			t -= 1
			
	if Input.is_action_just_pressed("right"):
		if t == 2:
			t = 1
		else:
			t += 1
	
	if t == 1:
		$"Outline(1)".position.x = 37
	elif t == 2:
		$"Outline(1)".position.x = 386
	else:
		$"Outline(1)".position.x = 726
