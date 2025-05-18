extends Node3D

var rngg = RandomNumberGenerator.new()
var ship = preload("res://sketchup models/sailing_ship.fbx/Sailing_ship_model.tscn")
var duckify = rngg.randi_range(1,3)


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rngg.randomize()
	duckify = rngg.randi_range(1,3)
	print(duckify)


func _on_rng_timer_timeout() -> void:
	if duckify == 1:
		var duck = ship.instantiate()
		add_child(duck)
	if duckify == 2:
		var duck = ship.instantiate()
		$rng2.add_child(duck)
	if duckify == 3:
		var duck = ship.instantiate()
		$rng3.add_child(duck)
