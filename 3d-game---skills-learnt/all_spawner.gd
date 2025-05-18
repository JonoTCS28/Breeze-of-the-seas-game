extends Button


func _on_pressed() -> void:
	if Gamerule.money > 1999 and Gamerule.score > 4999:
		Gamerule.terrain_created = 2000
		Gamerule.money -= 2000
