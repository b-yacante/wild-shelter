extends CharacterBody3D

@onready var player_input = $"Player Input"
var _speed: float = 0

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#handle direction
	var direction = (transform.basis * Vector3(player_input.direction.x, 0, player_input.direction.y)).normalized()
	if direction:
		transform.basis = Basis.looking_at(direction)
		velocity.x = direction.x * _speed
		velocity.z = direction.z * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)
		velocity.z = move_toward(velocity.z, 0, _speed)
	# Moving the Character
	move_and_slide()

	move_and_slide()
