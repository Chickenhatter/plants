extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Node2D/RichTextLabel.text = "And that is why us coders are not supposed to touch plants, you killed a plant after " + str(int(round(global.timer))) + " seconds"
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file('res://scenes/start.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
