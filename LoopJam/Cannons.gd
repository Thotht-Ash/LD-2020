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
		#breakpoint
		rotation -= 0.01
	if Input.is_action_pressed("rotate_counter"):
		#breakpoint
		rotation += 0.01
	if InputEventMouseMotion:
		look_at(get_global_mouse_position())
