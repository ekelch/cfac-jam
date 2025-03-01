extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var lines = get_children()
	for line in lines:
		var points = line.curve.get_baked_points()
		var visibleLine = Line2D.new();
		visibleLine.points = points
		visibleLine.width = 1.0
		visibleLine.antialiased = true
		self.add_child(visibleLine)
		for i in points.size() - 1:
			var segment = SegmentShape2D.new()
			segment.a = points[i]
			segment.b = points[i + 1]
			var collider = CollisionShape2D.new()
			collider.shape = segment
			self.add_child(collider)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
