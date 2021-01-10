extends Area2D

onready var ray = $RayCast2D
onready var tween = $Tween

export var speed = 3

var tile_size = 16
var inputs = {
	'ui_up':Vector2.UP,
	'ui_down':Vector2.DOWN,
	'ui_left':Vector2.LEFT,
	'ui_right':Vector2.RIGHT
}
	
func _unhandled_input(event):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(inputs[dir])
			if dir == 'ui_left':
				$Sprite.set_flip_h(false)
			elif dir == 'ui_right':
				$Sprite.set_flip_h(true)

func move(dir):
	var velocity = dir * tile_size
	
	ray.cast_to = velocity # Raycast to get next position collisions
	ray.force_raycast_update()
	
#	Check if next position has a obstacle
	var object = ray.get_collider()
	if !object:
		Global.move_tween(self, tween, velocity, speed)
	else:
#		If obstacle is a box move the player with the box
		if object.is_in_group('boxes'):
			if object.can_move(velocity): 
				Global.move_tween(object, object.tween, velocity, object.speed)
				Global.move_tween(self, tween, velocity, speed)
