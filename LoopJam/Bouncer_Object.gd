extends KinematicBody2D

# Declare member variables here. Examples:

signal damaged(type)
signal destroy
signal gameover

export var hitPoints = 2
export var speed = 10
var rotationSpeed
var normalised_v
var scale_v = 2
var dead = false


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass

func destroy():
	if global_position.x < 0 or global_position.y < 0 or global_position.x > 1024 or global_position.y > 600:
		connect("gameover", get_node("/root/World"), "end_state")
		emit_signal("gameover")
		disconnect("gameover", get_node("/root/World"), "end_state")
		get_parent().destroy(false)

func angular_velocity(angle, stop=false):
	if not stop:
		normalised_v = Vector2(cos(angle),sin(angle))
		position = position + normalised_v * 10
		rotate(angle + PI/2)
	else:
		normalised_v = Vector2(0,0)

func _process(delta):
	if hitPoints < 1 and not dead:
		get_parent().destroy()
		dead = true

func shootDown(normal):
	normalised_v = normalised_v.bounce(normal)
	hitPoints -= 1

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
		#elif "Plasma" in collidername:
			#self.connect("bounce", collision.collider, "bounce")
			#emit_signal("bounce")
			#self.disconnect("bounce", collision.collider, "bounce")
			#hitPoints -= 1
		elif collidername == "BlueCannon" or collidername == "RedCannon":
			hitPoints -= 1
		
		normalised_v = normalised_v.bounce(collision.normal)
		#if collidername.begins_with("wall"):
		#	pass # play wall animation
		#else:
		#	pass # play shot animation
	scale_v = scale_v*1.005
