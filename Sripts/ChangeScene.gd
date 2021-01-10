extends Button

export(PackedScene) var scene

func _pressed():
	var _change_scene = get_tree().change_scene_to(scene)
	
func _on_Quit_pressed():
	get_tree().quit()

func _on_button_mouse_entered():
	if disabled == false:
		get_node("../../AudioStreamPlayer").playing = true
