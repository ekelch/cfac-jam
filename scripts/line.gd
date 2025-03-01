extends StaticBody2D

@onready var path_2d: Path2D = $Path2D
@onready var visLine: Line2D = $Line2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var points = path_2d.curve.get_baked_points()
	visLine.points = points
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
