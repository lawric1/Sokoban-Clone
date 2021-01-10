extends Control

onready var levels = Global.disabled_levels

func _ready():
	for level in levels.keys():
		var btn = get_node("GridContainer/" + level)
		btn.disabled = levels[level]
	
