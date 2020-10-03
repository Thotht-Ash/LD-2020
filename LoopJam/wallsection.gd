extends StaticBody2D

var zero = Vector2(0,0)
var health = 50
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
func damaged(type):
	print("A Driller hit")
	if type == "driller":
		health = health - 5
	
	# if health < threshold:
	# load new image
