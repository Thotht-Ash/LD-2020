extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var driller = load("res://Driller.tscn")
	var enemy = driller.instance()
	add_child_below_node(get_tree().get_root().get_node("BlackHole"),enemy)
	enemy.angular_velocity(deg2rad(rand_range(1,360)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
