extends Button




func _on_pressed() -> void:
	if Gamerule.money > 149:
		Gamerule.terrain_created = 500
		Gamerule.money -= 150
