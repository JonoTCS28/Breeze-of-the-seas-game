extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	update_score_text()

func update_score_text():
	text = "score: " + str(Gamerule.score)
