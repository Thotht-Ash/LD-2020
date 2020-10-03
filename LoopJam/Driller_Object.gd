extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var normalised_v
var scale_v = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func angular_velocity(angle):
	normalised_v = Vector2(cos(angle),sin(angle))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(normalised_v * scale_v * delta)
	if collision:
		var collidername = collision.collider().get_meta("name")
		if collidername.begins_with("wall"):
			pass # play wall animation
		else:
			pass # play shot animation
	scale_v = scale_v*1.005
