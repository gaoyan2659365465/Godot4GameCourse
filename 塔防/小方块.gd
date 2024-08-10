class_name 小方块 extends Node2D


var path_follow:PathFollow2D
var 速度:int = 200


func _process(delta: float) -> void:
	path_follow.progress += 速度*delta
	if path_follow.progress_ratio >= 1:
		path_follow.queue_free()
