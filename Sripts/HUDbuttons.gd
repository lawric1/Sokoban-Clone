extends TextureButton

onready var pause_screen = get_node("../../Pause_screen")

func _unhandled_input(event):
	if event.is_action_pressed('Reload'):
		var _reload = get_tree().reload_current_scene()
		
	elif event.is_action_pressed("Escape"):
		get_tree().paused = true
		pause_screen.show()


func _on_Reload_pressed():
	var _reload = get_tree().reload_current_scene()

func _on_Pause_pressed():
	get_tree().paused = true
	pause_screen.show()
	

