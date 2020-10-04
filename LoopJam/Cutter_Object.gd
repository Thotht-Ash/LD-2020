extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal damaged(type)
signal stop_cutter

var normalised_v
var scale_v = 2
var connected = false
var target


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func angular_velocity(angle):
	normalised_v = Vector2(cos(angle),sin(angle))
	position = position + normalised_v * 10
	rotate(angle + PI/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(normalised_v * scale_v * delta)
	if collision:
		var collidername = collision.collider.name
		if connected:
			if collidername == "RedCannon" or collidername == "BlueCannon":
				self.connect("stop_cutter", target, "stopped_cutter")
				emit_signal("stop_cutter")
				connected = false
			elif collidername != "wall":
				self.connect("stop_cutter", target, "stopped_cutter")
				emit_signal("stop_cutter")
				connected = false
				get_parent().cleanup()
		else:
			if collidername == "wall":
				target = collision.collider
				self.connect("damaged", target, "damaged")
				emit_signal("damaged", "cutter")
				self.disconnect("damaged", target, "damaged")
				connected = true
			elif not (collidername.begins_with("Cutter") or collidername.begins_with("Driller")) :
				get_parent().cleanup()
		#if collidername.begins_with("wall"):
		#	pass # play wall animation
		#else:
		#	pass # play shot animation
	scale_v = scale_v*1.005
