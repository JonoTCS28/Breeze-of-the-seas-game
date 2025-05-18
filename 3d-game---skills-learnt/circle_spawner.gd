extends Button



func _on_pressed() -> void:
	if Gamerule.money > 249:
		Gamerule.terrain_created = 1000
		Gamerule.money -= 250
