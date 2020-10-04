extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ship_shoot(plasma, direction, location):
	var p1 = plasma.instance()
	p1.position = location
	p1.angular_velocity(direction)
	p1.set_meta('type','shot')
	add_child(p1)

func end_state():
	print("Endstate reached")
