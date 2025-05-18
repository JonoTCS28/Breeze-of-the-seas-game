extends Area3D

var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_area_entered(area: StaticBody3D) -> void:
	if area.is_in_group("walls"):
		self.queue_free()
