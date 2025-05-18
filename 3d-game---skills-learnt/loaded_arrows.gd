extends Label




func update_score_text():
	text = "Loaded arrows: " + str(Gamerule.loaded_arrows)

func _process(delta: float) -> void:
	update_score_text()
