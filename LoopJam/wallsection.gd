extends StaticBody2D

var zero = Vector2(0,0)
var health = 50

signal destroyed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass

func damaged(type):
	if type == "driller":
		health = health - 50
	if type == "bouncer":
		health = health - 50
	if health < 1:
		emit_signal("destroyed")
		get_parent().visible = false
		get_parent().get_parent().explode()
		get_node("CollisionShape2D").disabled = true
	#if health < threshold:
	# load new image

func _input(event):
	if Input.is_action_pressed("restart"):
		get_parent().visible = true
		get_node("CollisionShape2D").disabled = false
		health = 50

func destroy():
	pass
