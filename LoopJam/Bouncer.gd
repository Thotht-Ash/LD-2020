extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func angular_velocity(angle):
	get_node("Bouncer_Object").angular_velocity(angle)
	
func destroy(sound=true):
	get_node("Bouncer_Object").angular_velocity(0, true)
	get_node("Bouncer_Object/bouncer").visible = false
	if $Bouncer_Object/CollisionPolygon2D:
		$Bouncer_Object/CollisionPolygon2D.free()
	get_node("Bouncer_Object/deathAnimation").visible = true
	get_node("Bouncer_Object/deathAnimation").play()
	if sound:
		get_node("deathsound").play()
		#yield(get_node("deathsound"), "finished")
	yield(get_node("Bouncer_Object/deathAnimation"),"animation_finished")
	call_deferred("free")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if Input.is_action_pressed("restart"):
		call_deferred("free")
