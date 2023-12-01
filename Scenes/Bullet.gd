extends CharacterBody2D

@export var speed = -10
var mouse_position = null
var vel = Vector2()
var gravity = 40
var t = false
var gamestart = false
@onready var s = $"../Label"
@onready var player = $"../Player"

func _physics_process(_delta):
	if player.dead == false:
		if s.upgrade == false:
			if player.gamestart == true:
				self.show()
				if t == false:
					position = get_global_mouse_position()
					position.y = 90
					position.x -= 570
					$Sprite2D.show()
					
				if Input.is_mouse_button_pressed( 1 ): # Left click
					t = true
				if t == true:
					position += Vector2(0, speed)
				
				if position.y <= -315:
					t = false

				if position.x >= 270:
					position.x = 270 
				elif position.x <= -334:
					position.x = -334
	
	else:
		self.hide()


func when_hit():
	$Sprite2D.hide()
	t = false
	$"../Ball hit".play()
