extends Node3D


var island = preload("res://Scenes/island_1.tscn")

var drng = RandomNumberGenerator.new()
var A = drng.randi_range(-9000,9000)
var B = drng.randi_range(-9000,9000)





func _terrain(pos):
	var island = island.instantiate()
	island.position = pos
	add_child(island)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var A = drng.randi_range(-9000,9000)
	var B = drng.randi_range(-9000,9000)
	
	if Gamerule.world_generation == 1:
		_terrain(Vector3 (A,0,B))

func _on_gen_timer_timeout() -> void:
	Gamerule.world_generation = 0
