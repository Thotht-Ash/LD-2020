extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var driller = load("res://Driller.tscn")
	var enemy = driller.instance()
	enemy.set_meta('type','driller')
	add_child(enemy)
	enemy.angular_velocity(rand_range(0, 2*PI))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
