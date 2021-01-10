extends Area2D

func _on_spot_body_entered(body):
	body.on_spot += 1

func _on_spot_body_exited(body):
	body.on_spot -= 1
	
