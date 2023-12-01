extends CharacterBody2D

var gravity = 500  # Gravity affecting the ball
var touch_ground = false
var t = true
var dead = false
var rand = RandomNumberGenerator.new()
var easy = 4
var medium = 6
var hard = 8
var add = rand.randf_range(-medium, medium)
var hit = false
var lvl = randi() % 4 + 1
var x = 0
var start = true
var fall = false
var less4 = true
var gamestart = false

@onready var s = $"../Label"
@onready var coll_4 = $Ball_4/CollisionShape2D
@onready var coll_3 = $Ball_3/CollisionShape2D
@onready var coll_2 = $Ball_2/CollisionShape2D
@onready var coll_1 = $Ball_1/CollisionShape2D
@onready var bullet = $"../Bullet"
@onready var player = $"../Player"

var elasticity = 0.995

func _process(delta):
	if player.dead == false:
		if s.upgrade == false:
			if player.gamestart == true:
				if start == true:
					if lvl == 3:
						$Ball4.hide()
						start = false
					elif lvl == 2:
						$Ball3.hide()
						$Ball4.hide()
						start = false
					elif lvl == 1:
						$Ball2.hide()
						$Ball3.hide()
						$Ball4.hide()
						start = false
								
				if lvl > 0:
						# Update velocity based on gravity
					position.x += add
					velocity.y += gravity * delta

							# Update position based on velocity
					position += velocity * delta

							# Check and handle collisions with the floor
					if position.y > 280:
						position.y = 280
						velocity.y = -velocity.y * elasticity
						$"../Ball_ground".play()
						

							# Check and handle collisions with the walls
					if position.x < -28 or position.x > 571:
						add = -1*add
					
				if position.y<-145:
					position.y = -145
			
			else:
				position.y = -148
				position.x = rand.randf_range(0, 500)
				
	else:
		position.y = -148
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("Bullet"):
		if lvl == 1:
			$Ball1.hide()
			lvl = 0
			bullet.when_hit()
			$"../Label".score += 1
			position.y = -148
			position.x = rand.randf_range(0, 500)
			start = true
			lvl = randi() % 4 + 1
			$Ball1.show()
			$Ball2.show()
			$Ball3.show()
			$Ball4.show()
		
		
	if area.is_in_group("Wall"):
		add = add *-1
	if area.is_in_group("Ground"):
		touch_ground = true



func _on_ball_2_area_entered(area):
	if area.is_in_group("Bullet"):
		if lvl == 2:
			$Ball2.hide()
			lvl = 1
			bullet.when_hit()
			$"../Label".score += 1
		
	if area.is_in_group("Wall"):
		add = add *-1
	if area.is_in_group("Ground"):
		touch_ground = true


func _on_ball_3_area_entered(area):
	if area.is_in_group("Bullet"):
		if lvl == 3:
			$Ball3.hide()
			lvl = 2
			bullet.when_hit()
			$"../Label".score += 1
		
	if area.is_in_group("Wall"):
		add = add *-1
	if area.is_in_group("Ground"):
		touch_ground = true

func _on_ball_4_area_entered(area):
	if area.is_in_group("Bullet"):
		if lvl == 4:
			$Ball4.hide()
			lvl = 3
			bullet.when_hit()
			$"../Label".score += 1
			
	if area.is_in_group("Wall"):
		add = add *-1
	if area.is_in_group("Ground"):
		touch_ground = true
