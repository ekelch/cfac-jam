extends RigidBody2D
@onready var mesh: MeshInstance2D = $MeshInstance2D
var colorMod = Color(0,0,0,1)

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if (event.is_action_pressed("modifier2")):
			colorMod.r = 1.
		if (event.is_action_released("modifier2")):
			colorMod.r = 0.
		if (event.is_action_pressed("bounce")):
			#physics_material_override.bounce = 1.0
			colorMod.g = 1.
			Engine.time_scale = .15
		if (event.is_action_released("bounce")):
			#physics_material_override.bounce = 0.0
			colorMod.g = 0.
			Engine.time_scale = 1
		if (event.is_action_pressed("modifier3")):
			colorMod.b = 1.
		if (event.is_action_released("modifier3")):
			colorMod.b = 0.
		if (event.is_action_pressed("grav_toggle")):
			gravity_scale = 0 if gravity_scale == 1 else 1
		mesh.modulate = colorMod
	
