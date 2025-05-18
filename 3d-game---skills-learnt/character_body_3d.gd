extends CharacterBody3D


var rng = RandomNumberGenerator.new()
var rotate = 5
@export var turnSpeed = PI/3 # angle per second in radians
@onready var state_machine = $Rogue_1/AnimationTree["parameters/playback"]

func _ready() -> void:
	Playerinfo.player = self

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and Gamerule.flying == false:
		velocity += get_gravity() * delta
	
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = Gamerule.JUMP_VELOCITY
		state_machine.travel("Jump")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("right", "left", "backward", "forward",)
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * Gamerule.SPEED
		velocity.z = direction.z * Gamerule.SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, Gamerule.SPEED)
		velocity.z = move_toward(velocity.z, 0, Gamerule.SPEED)
	
	if Input.is_action_just_pressed("sprint"):
		Gamerule.SPEED *= 2
		Gamerule.JUMP_VELOCITY *= 2
	if Input.is_action_just_released("sprint"):
		Gamerule.SPEED *= 0.5
		Gamerule.JUMP_VELOCITY *= 0.5
	if Input.is_action_just_pressed("backward"):
		Gamerule.SPEED *= 0.5
		Gamerule.JUMP_VELOCITY *= 0.5
	if Input.is_action_just_released("backward"):
		Gamerule.SPEED *= 2
		Gamerule.JUMP_VELOCITY *= 2
	
	if velocity.length() == 10:
		state_machine.travel("Walk")
	if velocity.length() == 0:
		state_machine.travel("Idle")
	if velocity.length() == 5:
		state_machine.travel("Backwards")
	if velocity.length() == 20:
		state_machine.travel("Running")
	
	if Input.is_action_just_pressed("ranged_attack"):
		state_machine.travel("Shoot")
	if Input.is_action_just_pressed("ranged_volley"):
		state_machine.travel("Shoot_volley")
	
	move_and_slide()
	
	
	rotation.y = rotate_toward(rotation.y, rotation.y + (turnSpeed * input_dir.x), turnSpeed * delta)
	if input_dir.x != 0:
		state_machine.travel("Turn")
	
	if Gamerule.can_fly == true and Input.is_action_just_pressed("fly"):
		Gamerule.flying = true
	if Input.is_action_just_released("fly"):
		Gamerule.flying = false

func _process(delta: float) -> void:
	if Gamerule.flying == true:
		position.y += Gamerule.flying_speed
		if Input.is_action_just_pressed("fly up"):
			Gamerule.flying_speed *= +1
		if Input.is_action_just_pressed("fly down"):
			Gamerule.flying_speed *= -1

func _on_timer_timeout() -> void:
	rng.randomize()
	rng.randi_range(0,6)


func _on_area_3d_body_entered(body: Node3D) -> void:
		if body.is_in_group("enemy"):
			Gamerule.Health -= Gamerule.total_enemy_damage
			if Gamerule.Health < 1:
				self.queue_free()
				Gamerule.is_game_over == true
				get_tree().change_scene_to_file("res://marketplace.tscn")
