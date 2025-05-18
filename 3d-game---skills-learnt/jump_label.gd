extends Label

func _process(delta: float) -> void:
	update_score_text()

func update_score_text():
	text = "Jump value: " + str(Gamerule.JUMP_VELOCITY)
