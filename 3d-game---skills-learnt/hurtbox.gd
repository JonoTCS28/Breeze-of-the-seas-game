class_name hurtbox
extends Area3D

func _init() -> void:
	collision_layer = 0
	collision_mask = 2


func _on_area_entered(hitbox) -> void:
#	if owner.has_method("_take_damage"):
#		owner.take_damage()
	if self.is_in_group("arrow"):
		Gamerule.damage = 1
