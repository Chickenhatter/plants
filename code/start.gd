extends Node2D
var slide = false
var up = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if global.gamemore == true:
		$"../slide".position.y = 0
		up = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if up == true:
		if $"../slide".position.y > -1000:
			$"../slide".position.y -= 10
		else:
			up = false
	if slide == true:
		if $"../slide".position.y < 0:
			$"../slide".position.y += 10
		else:
			slide = false


func _on_start_pressed() -> void:
	slide = true
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/planting.tscn")
