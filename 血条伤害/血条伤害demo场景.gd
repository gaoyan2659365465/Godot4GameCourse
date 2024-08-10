class_name 血条伤害Demo场景 extends Node2D

@onready var 敌人: 血条伤害demo敌人 = $"血条伤害Demo敌人"
@onready var canvas_layer: CanvasLayer = $CanvasLayer


func _on_button_pressed() -> void:
	敌人.扣血()
