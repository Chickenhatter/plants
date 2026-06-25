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
				if water_level <= 0:
					water_level = 40
				water_level += 30
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			if global.player_is_holding == "Nitrogen":
				if nitrogen_level <= 0:
					nitrogen_level = 40
				nitrogen_level += 30
	if gardener_in == true:
		if Input.is_action_just_pressed('ui_m'):
			global.player_is_holding = "None"
	nitrogen_level -= global.global_speed/2
	water_level -= global.global_speed*1.5
	if nitrogen_level > 100:
		nitrogen_level = 100
		$Node2D/health.scale.y -= 0.2
	if nitrogen_level > 0:
		$Node2D/nitrogen.scale.y = nitrogen_level/100
	else:
		$Node2D/health.scale.y -= 0.00015
	if water_level > 100:
		water_level = 100
		$Node2D/health.scale.y -= 0.2
	if water_level > 0:
		$Node2D/water.scale.y = water_level/100
	else:
		$Node2D/health.scale.y -= 0.00015
	if $Node2D/health.scale.y < 0:
		global.down = true


func _on_plant_3_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		gardener_in = true
		global.player_in_plant = true


func _on_plant_3_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		gardener_in = false
		global.player_in_plant = false
