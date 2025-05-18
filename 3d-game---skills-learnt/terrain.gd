extends RigidBody3D

var tlives = 4
var player_position
var target_position
var enemy_speed = 7.5
@onready var player = get_parent().get_node("Player")

func _ready() -> void:
	player = Playerinfo.player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("arrow"):
		tlives -= Gamerule.total_damage
		if tlives < 1:
			self.queue_free()
			Gamerule.arrows += 1
			Gamerule.money += 15
			Gamerule.score += 25
	if body.is_in_group("floor"):
		enemy_speed = 7.5
	else:
		enemy_speed = 0

func _physics_process(delta: float) -> void:
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		move_and_collide(target_position * enemy_speed)
		look_at(player_position)
