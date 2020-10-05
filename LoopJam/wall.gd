extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var particles = load("res://particle.tscn")

# Called when the node enters the scene tree for the first time.
func explode():
	var explosion = particles.instance()
	explosion.position = global_position
	explosion.rotation = global_rotation
	explosion.get_child(0).one_shot = true
	explosion.get_child(1).one_shot = true
	explosion.get_child(2).one_shot = true
	get_node("/root/World").add_child(explosion)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
