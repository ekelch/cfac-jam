extends StaticBody2D
@onready var path_2d: Path2D = $Path2D

func _ready() -> void:
	var paths = get_children()
	for path in paths:
		var points = path.curve.get_baked_points()
		var visibleLine = Line2D.new();
		visibleLine.points = points
		visibleLine.width = 2.0
		visibleLine.antialiased = true
		self.add_child(visibleLine)
		for i in points.size() - 1:
			var segment = SegmentShape2D.new()
			segment.a = points[i]
			segment.b = points[i + 1]
			var collider = CollisionShape2D.new()
			collider.shape = segment
			self.add_child(collider)
