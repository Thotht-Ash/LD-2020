extends KinematicBody2D

signal blackhole_contact
signal play_hit

export var speed = 100
export var bounceAllotment = 1
var velocity

# Called when the node enters the scene tree for the first time.
#func _ready():

func cleanup():
	$Sprite.visible = false
	if $CollisionShape2D:
		$CollisionShape2D.free()
	yield(get_node("hit"), "finished")
	call_deferred("free")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func angular_velocity(angle, stop=false):
	if not stop:
		velocity = Vector2(cos(angle),sin(angle))
		position = position + velocity * 10
		rotate(angle + PI/2)
	else:
		velocity = Vector2(0,0)

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collidername = collision.collider.name
		if collidername == "BlackHoleBody":
			#self.connect("blackhole_contact", collision.collider, "spawn")
			#emit_signal("blackhole_contact")
			#self.disconnect("blackhole_contact", collision.collider, "spawn")
			destroy()
		elif "Driller" in collidername:
			print(collidername)
			emit_signal("play_hit")
			self.connect("shootDown", collision.collider, "shootDown")
			emit_signal("shootDown")
			self.disconnect("shootDown", collision.collider, "shootDown")
			#var reflect = collision.remainder.bounce(collision.normal)
			#velocity = velocity.bounce(collision.normal)
			#move_and_collide(reflect)
			bounceAllotment -= 1
			if bounceAllotment < 0:
				cleanup()
		elif collidername == "wall":
			var reflect = collision.remainder.bounce(collision.normal)
			velocity = velocity.bounce(collision.normal)
			move_and_collide(reflect)
			emit_signal("play_hit")
			bounceAllotment -= 1
			if bounceAllotment < 0:
				cleanup()
		else:
			var reflect = collision.remainder.bounce(collision.normal)
			velocity = velocity.bounce(collision.normal)
			move_and_collide(reflect)
			emit_signal("play_hit")
			bounceAllotment -= 1
			if bounceAllotment < 0:
				cleanup()


func destroy():
	call_deferred("free")

func _on_Timer_timeout():
	destroy()
