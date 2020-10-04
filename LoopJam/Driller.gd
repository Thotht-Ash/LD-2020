extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func angular_velocity(angle):
	get_node("Driller_Object").angular_velocity(angle)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func destroy():
	call_deferred("free")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
