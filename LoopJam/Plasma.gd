extends KinematicBody2D

var velocity

# Called when the node enters the scene tree for the first time.
#func _ready():


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func angular_velocity(angle):
	velocity = Vector2(cos(angle),sin(angle))
	rotate(angle)

func _physics_process(delta):
	var collision = move_and_collide(velocity * 100 * delta)
	if collision:
		var collidername = collision.collider.name
		if collidername == "BlackHoleBody":
			call_deferred("free")
		elif collidername == "wall":
			call_deferred("free")
