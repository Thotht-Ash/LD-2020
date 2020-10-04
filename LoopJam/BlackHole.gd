extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var driller = load("res://Driller.tscn")
var cutter = load("res://Cutter.tscn")
var timer = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn()
	$Timer.start(timer)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn():
	var enemy
	#if randi() % 2 == 0:
	enemy = driller.instance()
	#else:
		#enemy = cutter.instance()
	add_child(enemy)
	enemy.angular_velocity(rand_range(0, 2*PI))

func _on_Timer_timeout():
	spawn()
	$Timer.start($Timer.time_left * 0.99)
