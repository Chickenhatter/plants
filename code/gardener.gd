extends CharacterBody2D
var move = 0
var timser = 1
var moving = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	moving = false
	var movement = Vector2.ZERO
	if global.player_move == true:
		if Input.is_action_pressed('ui_w'):
			move += delta * 10 * timser
			movement.y -= 1
			moving = true
		if Input.is_action_pressed('ui_s'):
			move += delta * 10 * timser
			movement.y += 1
			moving = true
		if Input.is_action_pressed('ui_a'):
			move += delta * 10 * timser
			movement.x -= 1
			moving = true
		if Input.is_action_pressed('ui_d'):
			move += delta * 10 * timser
			movement.x += 1
			moving = true
		if moving == true:
			if sin(move) > 0:
				$Node2D/Sprite2D.rotation_degrees = 15
			elif sin(move) == 0:
				$Node2D/Sprite2D.rotation_degrees = 0
			else:
				$Node2D/Sprite2D.rotation_degrees = -15
	else:
		$Node2D/Sprite2D.rotation_degrees = 0
	velocity = movement * 150
	global.character_position = $".".global_position
	
	move_and_slide()
