extends RigidBody2D
@onready var mesh: MeshInstance2D = $MeshInstance2D
@onready var force_timer: Timer = $ForceTimer

var colorMod = Color(0,0,0,1)
var boostValue: float = 20
var drawValue: float = 20
const force = 2500
	
func _process(delta: float) -> void:
	boost(delta)
	slowTime()
	mesh.modulate = colorMod
	
func boost(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		var impulse = force * delta
		var sub = delta * 30
		if boostValue - sub > 0:
			apply_impulse(linear_velocity.normalized() * impulse)
			boostValue -= sub
			colorMod.r = clampf(boostValue / 20, 0, 1) 

func slowTime() -> void:
	if Input.is_action_just_pressed("slow"):
		colorMod.g = 1.
		Engine.time_scale = .15
	if Input.is_action_just_released("slow"):
		colorMod.g = 0.
		Engine.time_scale = 1
