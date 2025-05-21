extends CharacterBody3D


var SPEED = 100
var rotate = 5
@export var turnSpeed = PI/3 # angle per second in radians

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and Gamerule.world_generation == 0:
		velocity += get_gravity() * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("tacking left", "tacking right", "forward", "Nothing")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
	
	rotation.y = rotate_toward(rotation.y, rotation.y + (turnSpeed * input_dir.x), turnSpeed * delta)
