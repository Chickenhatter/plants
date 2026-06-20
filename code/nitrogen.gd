extends Node2D
var on_floor = false
var in_character = true 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_character == true:
		if on_floor == true:
			if Input.is_action_just_pressed("ui_i"):
				if global.player_is_holding == "None":
					on_floor = false
					global.player_is_holding = "Nitrogen"
		if on_floor == false:
			if Input.is_action_just_pressed('ui_k'):
				on_floor = true
				global.player_is_holding = "None"
	
	
	if on_floor == false:
		$".".global_position = global.character_position
	
	if global.player_in_plant == true:
		if Input.is_action_just_pressed('ui_m'):
			if on_floor == false:
				$".".queue_free()


func _on_nitrogen_pickup_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		in_character = true


func _on_nitrogen_pickup_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		in_character = false
