extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("rotate_clockwise"):
		rotation -= 0.01
	if Input.is_action_pressed("rotate_counter"):
		rotation += 0.01


func _on_BlueCannon_shoot(Plasma, direction, location):
	var p1 = Plasma.instance()
	add_child_below_node(get_parent(),p1)
	p1.rotation = direction
	p1.position = location + (Vector2(cos(p1.rotation), sin(p1.rotation))*60)
	p1.velocity = Vector2(cos(p1.rotation), sin(p1.rotation))*60


func _on_RedCannon_shoot(Plasma, direction, location):
	var p2 = Plasma.instance()
	add_child_below_node(get_parent(),p2)
	p2.rotation = direction + PI
	p2.position = location + (Vector2(cos(p2.rotation), sin(p2.rotation))*60)
	p2.velocity = Vector2(cos(p2.rotation), sin(p2.rotation))*60
