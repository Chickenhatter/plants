extends Node2D
var up = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if up == true:
		$".".position.y -= 10
	if global.down == true:
		$".".position.y += 10
	if $".".position.y >= 0:
		global.down = false
		$".".position.y -= 10
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file('res://scenes/end.tscn')
	if $".".position.y <= -1000:
		up = false
	if $".".position.y >= 0:
		global.down = false
