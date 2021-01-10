extends PopupPanel

var scene = "res://Scenes/Menu/MainMenu.tscn"

func _on_Resume_pressed():
	self.hide()
	get_tree().paused = false


func _on_Menu_pressed():
	var _change_scene = get_tree().change_scene(scene)
	get_tree().paused = false
