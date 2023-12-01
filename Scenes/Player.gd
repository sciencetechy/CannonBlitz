extends CharacterBody2D

var gamestart = false
@onready var s = $"../Label"
var dead = false
	
func _physics_process(_delta):
	if dead == false:
		if s.upgrade == false:
			if gamestart == true:
				position = get_global_mouse_position()
				position.y = 90
				position.x -= 570
				if position.x >= 270:
					position.x = 270 
				elif position.x <= -334:
					position.x = -334
			else:
				if Input.is_action_just_pressed("left_click"):
					gamestart = true
	else:
		if Input.is_action_just_pressed("left_click"):
			dead = false
			
func _on_area_2d_area_entered(area):
	if area.is_in_group("Ball"):
		get_tree().quit()
