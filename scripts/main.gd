extends Node
@onready var player: RigidBody2D = $player

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	#if (Input.is_action_just_pressed("slow")):
		#Engine.time_scale = 0.2
	#if (Input.is_action_just_released("slow")):
		#Engine.time_scale = 1.0
