extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var array = ['driller', 'cutter']
var driller = load("res://Driller.tscn")
var cutter = load("res://Cutter.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var enemy
	#if randi() % 2 == 0:
	enemy = driller.instance()
	#else:
		#enemy = cutter.instance()
	add_child(enemy)
	enemy.angular_velocity(rand_range(0, 2*PI))
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var enemy
	#if randi() % 2 == 0:
	enemy = driller.instance()
	#else:
		#enemy = cutter.instance()
	add_child(enemy)
	enemy.angular_velocity(rand_range(0, 2*PI))
	$Timer.start($Timer.time_left * 0.99)
