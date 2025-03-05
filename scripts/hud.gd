extends CanvasLayer

@onready var player: RigidBody2D = %player
@onready var player_paths: StaticBody2D = %PlayerPaths

@onready var boost_bar: ProgressBar = $Control/HBoxContainer/BoostBar
@onready var draw_bar: ProgressBar = $Control/HBoxContainer/DrawBar

func _process(delta: float) -> void:
	boost_bar.value = player.boostValue
	draw_bar.value = player_paths.drawValue
