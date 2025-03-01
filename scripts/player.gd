extends CharacterBody2D


const SPEED = 130
const JUMP_VELOCITY = -270

func _draw():
	draw_circle(position, 8.0, Color(0.1,0.85,0.5,1))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
