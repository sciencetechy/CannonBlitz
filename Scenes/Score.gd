extends Label

var score = 0
var num_ball = 0
var upgrade = false
var prev_score = 0
@onready var bullet = $"../Bullet"
@onready var se = $"."
@onready var player = $"../Player"
var s_str = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	s_str = str(score)
	se.text = s_str
	
	if score % 2 == 0 and score != 0 and prev_score != score:
		upgrade = true
		prev_score = score
		
	if upgrade == true and Input.is_action_just_pressed("Gamestart"):
		upgrade = false
		if $"../Node2D".t == 1:
			pass
		elif $"../Node2D".t == 2:
			bullet.speed -= 1
		else:
			pass
	
	if player.dead == true:
		score = 0
