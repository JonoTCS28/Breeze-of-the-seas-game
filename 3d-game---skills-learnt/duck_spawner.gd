extends Button

func _on_pressed() -> void:
	if Gamerule.money > 449:
		Gamerule.terrain_created = 1500
		Gamerule.money -= 450
