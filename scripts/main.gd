extends Node
@onready var player: RigidBody2D = $player
var color_default

func _ready() -> void:
	color_default = player.mesh.modulate

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if (Input.is_action_just_pressed("bounce")):
		player.physics_material_override.bounce = 1.0
		player.mesh.modulate = Color(0.2,0.85,0.5,1.0)
	if (Input.is_action_just_released("bounce")):
		player.physics_material_override.bounce = 0.0
		player.mesh.modulate = color_default
	if (Input.is_action_just_pressed("slow")):
		Engine.time_scale = 0.2
	if (Input.is_action_just_released("slow")):
		Engine.time_scale = 1.0
