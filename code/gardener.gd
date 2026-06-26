extends CharacterBody2D
var move = 0
var timser = 1

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	print(sin(move))
	var movement = Vector2.ZERO
	if global.player_move == true:
		if Input.is_action_pressed('ui_w'):
			move += delta * 10 * timser
			movement.y -= 1
		if Input.is_action_pressed('ui_s'):
			move += delta * 10 * timser
			movement.y += 1
		if Input.is_action_pressed('ui_a'):
			move += delta * 10 * timser
			movement.x -= 1
		if Input.is_action_pressed('ui_d'):
			move += delta * 10 * timser
			movement.x += 1
	velocity = movement * 150
	global.character_position = $".".global_position
	move_and_slide()
