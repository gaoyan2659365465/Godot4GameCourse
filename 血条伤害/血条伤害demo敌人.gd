class_name 血条伤害demo敌人 extends Node2D


@onready var icon: Sprite2D = $"史莱姆"
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var texture_progress_bar_2: TextureProgressBar = $TextureProgressBar2



var 血量:int = 100
var 最大血量:int = 100


func 敌人缩放动画():
	var tween = create_tween()
	tween.tween_property(icon,"scale",Vector2(0.052,0.057),0.2)
	tween.tween_property(icon,"scale",Vector2(0.052,0.052),0.2)
	tween.tween_property(icon,"scale",Vector2(0.052,0.052),0.2)

func _on_timer_timeout() -> void:
	敌人缩放动画()

# 如果血量归0就消失
func 扣血():
	var b = randi_range(10,20)
	var a = 血量 - b
	if a >= 0:
		血量 = a
		texture_progress_bar_2.value = 血量
		高光血量动画(血量)
		生成伤害数字(b)
	else:
		print("死亡")
		#queue_free()


func 生成伤害数字(value):
	var harm_label = preload("res://血条伤害/伤害数字/harm_label.tscn").instantiate()
	var p = get_parent()
	p.canvas_layer.add_child(harm_label)
	var tran = self.get_canvas_transform()
	harm_label.set_text("-"+str(value))
	harm_label.position = tran * self.global_position
	harm_label.playAnim()


func 高光血量动画(hp):
	var tween = create_tween()
	tween.tween_property(texture_progress_bar,"value",hp,0.2)
