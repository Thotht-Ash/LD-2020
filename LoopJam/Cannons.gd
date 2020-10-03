extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("rotate_clockwise"):
		rotation -= 0.01
	if Input.is_action_pressed("rotate_counter"):
		rotation += 0.01


func _on_BlueCannon_shoot(Plasma, direction, location):
	var p1 = Plasma.instance()
	p1.position = location
	p1.angular_velocity(direction)
	add_child_below_node(get_parent(),p1)


func _on_RedCannon_shoot(Plasma, direction, location):
	var p2 = Plasma.instance()
	p2.position = location
	p2.angular_velocity(direction + PI)
	add_child_below_node(get_parent(),p2)
