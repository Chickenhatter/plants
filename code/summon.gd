extends Node2D
var char_in_water = false
var char_in_nitrogen = false

var allow = true

const summoned_nitrogen = preload("res://autos/nitrogen.tscn")
const summoned_water = preload("res://autos/water.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if allow == true:
		if char_in_water == true:
			if global.player_is_holding == "None":
				allow = false
				global.player_move = false
				await get_tree().create_timer(1).timeout
				global.player_move = true
				water_summoning()
				global.player_is_holding = "Water"
				await get_tree().create_timer(0.5).timeout
				allow = true
		if char_in_nitrogen == true:
			if global.player_is_holding == "None":
				allow = false
				global.player_move = false
				await get_tree().create_timer(1).timeout
				nitrogen_summoning()
				global.player_move = true
				global.player_is_holding = "Nitrogen"
				await get_tree().create_timer(0.5).timeout
				allow = true
			


func _on_water_refill_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		char_in_water = true

func _on_water_refill_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		char_in_water = false


func _on_nitrogen_refill_body_entered(body: Node2D) -> void:
	if body.name == "Gardener":
		char_in_nitrogen = true


func _on_nitrogen_refill_body_exited(body: Node2D) -> void:
	if body.name == "Gardener":
		char_in_nitrogen = false


func water_summoning():
	var water = summoned_water.instantiate()
	water.global_position = global.character_position
	var parent = $"../../box"
	parent.add_child(water)
func nitrogen_summoning():
	var nitrogen = summoned_nitrogen.instantiate()
	nitrogen.global_position = global.character_position
	var parent = $"../../box"
	parent.add_child(nitrogen)
