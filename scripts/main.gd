extends Node
var running: bool = false
@onready var player: RigidBody2D = $Game/player

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		if running:
			print("stopping")
			get_tree().reload_current_scene()
		else:
			print("starting")
			running = true
			player.gravity_scale = 1
