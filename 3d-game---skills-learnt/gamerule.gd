extends Node

var drng = RandomNumberGenerator.new()
var arrows = 20
var Health = 25
var Armour = 3
var score = 0
var is_game_over = false
var loaded_arrows = 0
var money = 150
var SPEED = 10
var JUMP_VELOCITY = 5
var reload = 1
var terrain_created = 0
var stashed_arrows = 20
var can_fly = false
var flying = false
var flying_speed = 2

var b = 6
var c = 0
var damage = drng.randi_range(1,b)
var total_damage = damage + c

var j = 1
var k = 6
var l = 1
var enemy_damage = drng.randi_range(j,k)
var total_enemy_damage = enemy_damage + l - Armour

func _process(delta: float) -> void:
	damage = drng.randi_range(1,b)
	total_damage = damage + c
	
	enemy_damage = drng.randi_range(j,k)
	total_enemy_damage = enemy_damage + l - Armour
	
	if total_enemy_damage < 0:
		total_enemy_damage = 0
