extends Node
var player_is_holding = "None"
var character_position = false
var player_in_plant = false
var player_move = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(player_is_holding)
