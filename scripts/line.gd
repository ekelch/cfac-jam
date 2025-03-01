extends StaticBody2D

@onready var line_2d: Line2D = $Line2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in line_2d.points.size() - 1:
		var segment = SegmentShape2D.new()
		segment.a = line_2d.points[i]
		segment.b = line_2d.points[i + 1]
		var collider = CollisionShape2D.new()
		collider.shape = segment
		self.add_child(collider)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
