extends StaticBody2D

var lastPoint: Vector2 = Vector2(0,0)
var visLine: Line2D
var point: Vector2
var reset: bool = true

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if reset:
			reset = false
			startNewLine()
		elif get_global_mouse_position().distance_to(point) > 10:
			continueLine()
	elif Input.is_action_just_released("draw"):
		redrawSmooth()
		reset = true
		
func startNewLine():
	point = get_global_mouse_position()
	visLine = Line2D.new()
	visLine.add_point(point)
	visLine.width = 1.0
	visLine.modulate = Color(1,0,0)
	self.add_child(visLine)

func redrawSmooth():
	visLine.modulate = Color(1,1,1)
	visLine.width = 2.
	var segment: SegmentShape2D
	var collider: CollisionShape2D
	for i in visLine.points.size() - 1:
		collider = CollisionShape2D.new()
		segment = SegmentShape2D.new()
		segment.a = visLine.points[i]
		segment.b = visLine.points[i + 1]
		collider.shape = segment
		add_child(collider)

func continueLine():
	point = get_global_mouse_position()
	visLine.add_point(point)
