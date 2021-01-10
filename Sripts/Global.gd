extends Node

onready var levelselect = "res://Scenes/Menu/LevelSelect.tscn"

var current_level = null
var next_level = null

var boxes = []
var disabled_levels = {
	'Level_1': false,
	'Level_2': true,
	'Level_3': true,
	'Level_4': true,
	'Level_5': true,
	'Level_6': true,
	'Level_7': true,
	'Level_8': true,
	'Level_9': true,
	'Level_10': true
}

func _process(_delta):
	var root = get_tree().get_root()
	current_level = root.get_children()[-1]
	next_level = "Level_" + str(int(current_level.name.substr(6,1)) + 1)

func check_states():
#	Check if all boxes in current scene are on spot
	boxes = current_level.get_tree().get_nodes_in_group('boxes')
	for box in boxes:
		if !box.on_spot:
			return
#	Check if next_level exists and change its state
	if next_level in disabled_levels.keys():
		disabled_levels[next_level] = false
	
#	Go to level select scene
	var _change_scene = get_tree().change_scene(levelselect)

#Tween function to move and animate objects
func move_tween(object, tween, velocity, speed):
	var final_pos = object.position + velocity
	
	tween.interpolate_property(object, "position",
		object.position, final_pos, 1.0/speed,
		Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()


