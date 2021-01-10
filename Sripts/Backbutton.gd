extends TextureButton

var scene = "res://Scenes/Menu/MainMenu.tscn"

func _unhandled_input(event):
	if event.is_action_pressed("Escape"):
		var _change_scene = get_tree().change_scene(scene)
		
func _on_Back_pressed():
	var _change_scene = get_tree().change_scene(scene)

func _on_Back_mouse_entered():
	get_node("../AudioStreamPlayer").playing = true
