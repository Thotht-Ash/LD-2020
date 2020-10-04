extends KinematicBody2D

# Declare member variables here. Examples:

signal damaged(type)
signal destroy

export var hitPoints = 3
export var speed = 10
var rotationSpeed
var normalised_v
var scale_v = 2
var dead = false


# Called when the node enters the scene tree for the first time.
func _ready():
	rotationSpeed = rand_range(-PI/360,PI/360)

func angular_velocity(angle, stop=false):
	if not stop:
		normalised_v = Vector2(cos(angle),sin(angle))
		position = position + normalised_v * 10
		rotate(angle + PI/2)
	else:
		normalised_v = Vector2(0,0)

func _process(delta):
	rotation += rotationSpeed
	if hitPoints < 1 and not dead:
		get_parent().cleanup()
		dead = true

# Called every frame. 'delta' is the elapsed time since the previous frame.	
func _physics_process(delta):
	var collision = move_and_collide(normalised_v * scale_v * delta)
	if collision:
		var collidername = collision.collider.name
		if collidername == "wall":
			self.connect("damaged", collision.collider, "damaged")
			emit_signal("damaged", "bouncer")
			self.disconnect("damaged", collision.collider, "damaged")
			hitPoints -= 1
		elif "Plasma" in collidername:
			self.connect("destroy", collision.collider, "destroy")
			emit_signal("destroy")
			self.disconnect("destroy", collision.collider, "destroy")
			hitPoints -= 1
		elif collidername == "BlueCannon" or collidername == "RedCannon":
			hitPoints -= 1
		else:
			print(collidername)
		
		var reflect = collision.remainder.bounce(collision.normal)
		normalised_v = normalised_v.bounce(collision.normal)
		move_and_collide(reflect)
		#if collidername.begins_with("wall"):
		#	pass # play wall animation
		#else:
		#	pass # play shot animation
	scale_v = scale_v*1.005
