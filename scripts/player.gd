extends RigidBody2D
@onready var mesh: MeshInstance2D = $MeshInstance2D
@onready var force_timer: Timer = $ForceTimer

var colorMod = Color(0,0,0,1)
var boostValue: float = 50
var drawValue: float = 20
const force = 2500

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if (event.is_action_pressed("slow")):
			colorMod.g = 1.
			Engine.time_scale = .15
		if (event.is_action_released("slow")):
			colorMod.g = 0.
			Engine.time_scale = 1
			
		if (event.is_action_pressed("grav_toggle")):
			gravity_scale = 0 if gravity_scale == 1 else 1
		mesh.modulate = colorMod
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		boost(delta)
	
func boost(delta: float) -> void:
	var impulse = force * delta
	var sub = delta * 30
	if boostValue - sub > 0:
		apply_impulse(linear_velocity.normalized() * impulse)
		boostValue -= sub
