extends Node2D
var player_in = false
var water_level = 70
var nitrogen_level = 70
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Water":
				water_level += 40
	if player_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Nitrogen":
				nitrogen_level += 40
	
	water_level -= 0.01
	nitrogen_level -= 0.01

func _on_plant_3_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		player_in = true
		global.player_in_plant = true


func _on_plant_3_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		player_in = false
		global.player_in_plant = false
