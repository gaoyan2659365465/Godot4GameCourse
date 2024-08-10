class_name 引导场景 extends Control


@onready var 小手: 小手动效 = $"小手动效"


func _on_button_pressed() -> void:
	print("123")


func _ready() -> void:
	引导对话1()


func 引导对话1():
	var yd = preload("res://引导/引导对话框.tscn").instantiate()
	self.add_child(yd)
	yd.设置内容("怪物大军即将到来，赶快布置水果勇士，准备迎战吧！")
	yd.position = Vector2(0,0)
	
	var xyb = preload("res://引导/进入下一步.tscn").instantiate()
	self.add_child(xyb)
	# 玩家点击屏幕时销毁
	xyb.玩家点击.connect(func():
		yd.queue_free()
		引导对话2())


func 引导对话2():
	var zz = preload("res://引导/引导遮罩.tscn").instantiate()
	self.add_child(zz)
	move_child(小手,-1)
	zz.initMask(Rect2(Vector2(902,107),Vector2(132,73)))
	zz.过渡动画()
	# 当某个信号被触发以后应该关闭引导遮罩，进入下一阶段
	
	var yd = preload("res://引导/引导对话框.tscn").instantiate()
	self.add_child(yd)
	yd.设置内容("将商店中刷新出的装备放置到背包")
	yd.position = Vector2(0,-100)
