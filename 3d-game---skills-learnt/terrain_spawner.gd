extends MeshInstance3D

var duck = preload("res://duck.tscn")
var triangle = preload("res://triangle.tscn")
var circle = preload("res://circle_terrain.tscn")
var terrain = preload("res://terrain.tscn")
var health = preload("res://health_image.tscn")


var life = 60

func _on_timer_timeout() -> void:
	if Gamerule.terrain_created == 0:
		create_terrain()
	if Gamerule.terrain_created == 500:
		create_triangle_terrain()
	if Gamerule.terrain_created == 1000:
		create_circle_terrain()
	if Gamerule.terrain_created == 1500:
		create_duck()
	if Gamerule.terrain_created == 2000 and Gamerule.score > 4999:
		create_all()

func create_circle_terrain():
	var circle = circle.instantiate()
	add_child(circle)


func create_terrain():
	var terrain = terrain.instantiate()
	add_child(terrain)


func create_triangle_terrain():
	var triangle = triangle.instantiate()
	add_child(triangle)


func create_duck():
	var duck = duck.instantiate()
	add_child(duck)

func take_health():
	var health = health.instantiate()
	add_child(health)


func _take_damage():
	life -= Gamerule.damage
	take_health()
	if life < 1:
		self.queue_free()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("arrow"):
		_take_damage()

func create_all():
	create_circle_terrain()
	create_duck()
	create_terrain()
	create_triangle_terrain()
