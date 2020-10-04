extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func angular_velocity(angle):
	get_node("Driller_Object").angular_velocity(angle)
	
func cleanup():
	get_node("Driller_Object").speed = 0
	get_node("Driller_Object/driller").visible = false
	get_node("Driller_Object/deathAnimation").visible = true
	get_node("Driller_Object/deathAnimation").play()
	yield(get_node("Driller_Object/deathAnimation"),"animation_finished")
	call_deferred("free")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
