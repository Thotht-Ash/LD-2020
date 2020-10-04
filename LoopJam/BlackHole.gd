extends Node2D

var driller = load("res://Driller.tscn")
var bouncer = load("res://Bouncer.tscn")
var timer = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn()
	$Timer.start(timer)



func spawn():
	var enemy
	if randi() % 4 == 0:
		enemy = bouncer.instance()
	else:
		enemy = driller.instance()
	add_child(enemy)
	enemy.angular_velocity(rand_range(0, 2*PI))

func _on_Timer_timeout():
	spawn()
	timer = timer*0.999
	if timer < 1:
		timer = 1
	$Timer.start(timer)

func _on_World_GameRestart():
	timer = 5
