extends KinematicBody2D


# Declare member variables here. Examples:

signal damaged(type)
signal destroy

export var speed = 10
var normalised_v
var scale_v = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func angular_velocity(angle):
	normalised_v = Vector2(cos(angle),sin(angle))
	position = position + normalised_v * speed
	rotate(angle + PI/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.	
func _physics_process(delta):
	var collision = move_and_collide(normalised_v * scale_v * delta)
	if collision:
		var collidername = collision.collider.name
		if collidername == "wall":
			self.connect("damaged", collision.collider, "damaged")
			emit_signal("damaged", "driller")
			self.disconnect("damaged", collision.collider, "damaged")
			get_parent().cleanup()
		elif "Plasma" in collidername:
			self.connect("destroy", collision.collider, "destroy")
			emit_signal("destroy")
			self.disconnect("destroy", collision.collider, "destroy")
			get_parent().cleanup()
		elif collidername == "BlueCannon" or collidername == "RedCannon":
			get_parent().cleanup()
		else:
			print(collidername)
		#if collidername.begins_with("wall"):
		#	pass # play wall animation
		#else:
		#	pass # play shot animation
	scale_v = scale_v*1.005
