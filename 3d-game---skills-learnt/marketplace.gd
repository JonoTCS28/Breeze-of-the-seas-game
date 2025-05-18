extends Node2D


func _on_damage_increase_pressed() -> void:
	if Gamerule.money > 100:
		Gamerule.damage += 3
		Gamerule.money -= 100
