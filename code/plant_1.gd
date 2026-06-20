extends Node2D
var gardener_in = false
var nitrogen_level = 70
var water_level = 70
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	print()
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Water":
				print('a')
				water_level += 40
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Nitrogen":
				nitrogen_level += 40
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			global.player_is_holding = "None"
	nitrogen_level -= 0.001
	water_level -= 0.001


func _on_plant_1_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		gardener_in = true
		global.player_in_plant = true


func _on_plant_1_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		gardener_in = false
		global.player_in_plant = false
