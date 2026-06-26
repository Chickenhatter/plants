extends Node2D
var up = true
var down = false
var minute = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.gamemore = true
	if int(round(global.timer)) > 60:
		minute
	else:
		$Node2D/RichTextLabel.text = "And that is why us coders are not supposed to touch plants, you killed a plant after " + str(int(round(global.timer))) + " seconds"
	await get_tree().create_timer(2).timeout
	up = false
	await get_tree().create_timer(2).timeout
	down = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file('res://scenes/start.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if up == true:
		$"../slide".position.y -= 10
	if down == true:
		$"../slide".position.y += 10
