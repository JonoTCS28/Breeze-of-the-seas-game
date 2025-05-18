extends Label



func _process(delta: float) -> void:
	update_score_text()

func update_score_text():
	text = "Damage:  " + str(Gamerule.damage) + " + " + str(Gamerule.c)
