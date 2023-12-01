extends Area2D

var t = false

func _physics_process(delta):
	if t == false:
		position = get_global_mouse_position()
		position.y = 90
		position.x -= 570
		
	if Input.is_mouse_button_pressed( 1 ): # Left click
		t = true
	if t == true:
		position += Vector2(0, -10)
	
	if position.y <= -315:
		t = false

	if position.x >= 270:
		position.x = 270 
	elif position.x <= -334:
		position.x = -334
