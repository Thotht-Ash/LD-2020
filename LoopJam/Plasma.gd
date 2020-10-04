extends KinematicBody2D

signal blackhole_contact

export var speed = 100
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
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collidername = collision.collider.name
		if collidername == "BlackHoleBody":
			self.connect("blackhole_contact", collision.collider, "spawn")
			emit_signal("blackhole_contact")
			self.disconnect("blackhole_contact", collision.collider, "spawn")
			call_deferred("free")
		elif collidername == "wall":
			var reflect = collision.remainder.bounce(collision.normal)
			velocity = velocity.bounce(collision.normal)
			move_and_collide(reflect)
			
func destroy():
	call_deferred("free")


func _on_Timer_timeout():
	destroy()
