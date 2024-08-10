class_name HarmLabel extends Label


# 伤害数字

func playAnim() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	var x = position.x
	var y = position.y
	self.set("modulate",Color(1.0,1.0,1.0,0.0))
	tween.tween_property(self,"position",Vector2(x,y-40),0.3)
	tween.tween_property(self,"scale",Vector2(1.1,1.1),0.2)
	tween.tween_property(self,"scale",Vector2(1.0,1.0),0.2).set_delay(0.2)
	tween.tween_property(self,"modulate",Color(1.0,1.0,1.0,1.0),0.2)
	tween.tween_property(self,"modulate",Color(1.0,1.0,1.0,0.0),0.2).set_delay(0.3)
	await get_tree().create_timer(0.5).timeout
	queue_free()
