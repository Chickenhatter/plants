extends Node2D
var gardener_in = false
var nitrogen_level = 70
var water_level = 70
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Water":
				water_level += 40
				if water_level <= 0:
					water_level = 80
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Nitrogen":
				nitrogen_level += 40
				if nitrogen_level <= 0:
					nitrogen_level = 80
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			global.player_is_holding = "None"
	nitrogen_level -= 0.04
	water_level -= 0.04
	if nitrogen_level > 0:
		$Node2D/nitrogen.scale.y = nitrogen_level/100
	else:
		$Node2D/health.scale.y -= 0.00015
	if water_level > 0:
		$Node2D/water.scale.y = water_level/100
	else:
		$Node2D/health.scale.y -= 0.00015
	if $Node2D/health.scale.y < 0:
		pass

func _on_plant_1_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		gardener_in = true
		global.player_in_plant = true


func _on_plant_1_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		gardener_in = false
		global.player_in_plant = false
