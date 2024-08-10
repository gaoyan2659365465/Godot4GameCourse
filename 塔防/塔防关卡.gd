class_name 塔防关卡 extends Node2D

@onready var path_2d: Path2D = $Path2D


var json
func _ready() -> void:
	self.json = preload("res://塔防/数据表/游戏数据表.json")

func 根据章节和波数获取出怪顺序(_zj, _bs):
	var data = self.json.data['出怪顺序']
	var bz = []
	for key in data:
		if data[key]["章节"] == _zj:
			if data[key]["波数"] == _bs:
				bz.append([data[key]["出怪步骤"], data[key]["敌人ID"], data[key]["数量"], data[key]["间隔时间"]])
	return bz


func 开始新一波():
	var data = 根据章节和波数获取出怪顺序(1, 1)
	for i in data:
		var 出怪步骤 = i[0]
		var 敌人ID = i[1]
		var 数量 = i[2]
		var 间隔时间 = i[3]
		
		for n in range(数量):
			生成敌人()
			await get_tree().create_timer(0.05).timeout
		await get_tree().create_timer(间隔时间).timeout


func _on_button_pressed() -> void:
	开始新一波()

func 生成敌人():
	var pf = PathFollow2D.new()
	pf.rotates = false
	pf.loop = false
	path_2d.add_child(pf)
	
	var dr = preload("res://塔防/小方块.tscn").instantiate()
	dr.path_follow = pf
	pf.add_child(dr)
