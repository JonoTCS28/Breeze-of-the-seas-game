class_name hitbox
extends Area3D

@export var damage = Gamerule.damage

func _init() -> void:
	collision_layer = 2
	collision_mask = 0
