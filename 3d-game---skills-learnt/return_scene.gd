extends Button

func _ready() -> void:
	set_as_top_level(true)

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scene.tscn")
	if Gamerule.arrows == 0:
		Gamerule.arrows += Gamerule.stashed_arrows
