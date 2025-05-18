extends RigidBody3D

@export var spped = 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += spped * delta
	

func _on_timer_timeout() -> void:
	self.queue_free()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Terrain"):
		self.queue_free()
	if body.is_in_group("walls"):
		self.queue_free()
