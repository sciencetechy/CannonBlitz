extends Area2D

var en = false
var ex = false
var cnt = 0

func _physics_process(delta):
	position = get_global_mouse_position()
	position.y = 90
	position.x -= 570
	if position.x >= 270:
		position.x = 270 
	elif position.x <= -334:
		position.x = -334
	

	
	if en == true and ex == true:
		get_tree().quit()
	else:
		if cnt >= 5:
			en = false
			ex = false
		else:
			cnt += 1

func _on_body_entered(body):
	en = true
	
func _on_body_exited(body):
	ex = true
