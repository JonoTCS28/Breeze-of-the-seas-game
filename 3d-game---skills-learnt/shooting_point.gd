extends Node3D

var arrow = preload("res://arrow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func shoot_arrow():
	var arrow = arrow.instantiate()
	add_child(arrow)
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ranged_attack") and Gamerule.loaded_arrows > 0 and Gamerule.arrows > 0:
		shoot_arrow()
		Gamerule.loaded_arrows -= 1
		Gamerule.arrows -= 1
	if Gamerule.arrows == 0:
		get_tree().change_scene_to_file("res://marketplace.tscn")


func _on_timer_timeout() -> void:
	Gamerule.loaded_arrows += Gamerule.reload
