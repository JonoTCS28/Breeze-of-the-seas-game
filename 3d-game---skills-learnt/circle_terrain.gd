extends RigidBody3D

var Tlives = 20
var player_position
var target_position
var enemy_speed = 5
@onready var player = get_parent().get_node("Player")

func _ready() -> void:
	player = Playerinfo.player
	Gamerule.j = 3
	Gamerule.k = 12
	Gamerule.l = 2

func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("arrow"):
		Tlives -= Gamerule.total_damage
		if Tlives < 1:
			self.queue_free()
			Gamerule.arrows += 3
			Gamerule.money += 75
			Gamerule.score += 90

func _physics_process(delta: float) -> void:
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		move_and_collide(target_position * enemy_speed)
		look_at(player_position)
