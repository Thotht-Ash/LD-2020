extends KinematicBody2D


# Declare member variables here. Examples:

signal damaged(type)
signal destroy
signal gameover


var normalised_v
export var scale_v = 2
export var acceleration = 5
var accelerationFactor = acceleration/1000+1

func destroy():
	if global_position.x < 0 or global_position.y < 0 or global_position.x > 1024 or global_position.y > 600:
		connect("gameover", get_node("/root/World"), "end_state")
		emit_signal("gameover")
		disconnect("gameover", get_node("/root/World"), "end_state")
		get_parent().destroy(false)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func angular_velocity(angle, stop=false):
	if not stop:
		normalised_v = Vector2(cos(angle),sin(angle))
		position = position + normalised_v * 10
		rotate(angle + PI/2)
	else:
		normalised_v = Vector2(0,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.	
func _physics_process(delta):
	var collision = move_and_collide(normalised_v * scale_v * delta)
	if collision:
		var collidername = collision.collider.name
		if collidername == "wall":
			self.connect("damaged", collision.collider, "damaged")
			emit_signal("damaged", "driller")
			self.disconnect("damaged", collision.collider, "damaged")
			get_parent().destroy()
		elif "Plasma" in collidername:
			print(collidername)
			self.connect("destroy", collision.collider, "destroy")
			emit_signal("destroy")
			self.disconnect("destroy", collision.collider, "destroy")
			get_parent().destroy()
		elif collidername == "BlueCannon" or collidername == "RedCannon":
			get_parent().destroy()
		else:
			print(collidername)
		#if collidername.begins_with("wall"):
		#	pass # play wall animation
		#else:
		#	pass # play shot animation
	scale_v = scale_v*accelerationFactor
