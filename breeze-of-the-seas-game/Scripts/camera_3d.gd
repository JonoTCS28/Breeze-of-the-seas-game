extends Camera3D

var rotate = 5
@export var turnSpeed = PI/3 # angle per second in radians

# Called when the node enters the scene tree for the first time.zzz
func _ready() -> void:
	pass # Replace with function body.



func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("look right", "look left", "look down", "look up")
	
	rotation.y = rotate_toward(rotation.y, rotation.y + (turnSpeed * input_dir.x), turnSpeed * delta)
	
	rotation.x = rotate_toward(rotation.x, rotation.x + (turnSpeed * input_dir.y), turnSpeed * delta)
