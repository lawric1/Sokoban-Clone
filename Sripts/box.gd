extends KinematicBody2D

var box_normal = preload("res://assets/box.png")
var box_active = preload("res://assets/box2.png")

onready var ray = $RayCast2D
onready var tween = $Tween

export var speed = 3
export var on_spot = 0 # Value to know if box overlaps a spot
var tile_size = 16

func _process(_delta):
	if on_spot:
		$Sprite.set_texture(box_active)
		Global.check_states()
	else:
		$Sprite.set_texture(box_normal)

# Check if next tile the box moves to is not an obstacle
func can_move(velocity):
	ray.cast_to = velocity
	ray.force_raycast_update()
	
	var object = ray.get_collider()
	$AudioStreamPlayer.playing = true
	
	if !object:
		return true
	Global.current_level.get_node("Camera").shake()	
	return false
