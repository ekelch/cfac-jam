extends StaticBody2D

var lastPoint: Vector2 = Vector2(0,0)
var visLine: Line2D
var segment: SegmentShape2D
var point: Vector2
var reset: bool = true

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if reset:
			reset = false
			point = get_global_mouse_position()
			visLine = newLine(point)
			self.add_child(visLine)
		elif get_global_mouse_position().distance_to(point) > 10:
			segment = SegmentShape2D.new()
			segment.a = point
			point = get_global_mouse_position()
			segment.b = point
			visLine.add_point(point)
			var collider = CollisionShape2D.new()
			collider.shape = segment
			self.add_child(collider)
			
		
	else:
		reset = true

func newLine(p: Vector2) -> Line2D:
	var l = Line2D.new()
	l.add_point(p)
	l.width = 2.0
	return l
