extends KinematicBody2D

var zero = Vector2(0,0)
var health = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(zero)
	if collision:
		var collidername = collision.collider.name
		if collidername != "RedCannon" && collidername != "wall":
			print(collidername)
			health = health - 10
