extends RigidBody3D

var Tlives = 28

func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("arrow"):
		Tlives -= Gamerule.total_damage
		if Tlives < 1:
			self.queue_free()
			Gamerule.arrows += 5
			Gamerule.money += 120
			Gamerule.score += 200
