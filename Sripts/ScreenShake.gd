extends Camera2D

var time = 0

var duration = 0.10
var magnitude = 1

func shake():
	var initial_offset = self.offset
	while time < duration:
		time += get_process_delta_time()
		
		var offset = Vector2()
		offset.x = rand_range(-magnitude, magnitude)
		offset.y = rand_range(-magnitude, magnitude)
		self.offset = initial_offset + offset
		
		yield(get_tree(), "idle_frame")
	self.offset = initial_offset
	time = 0
	pass
