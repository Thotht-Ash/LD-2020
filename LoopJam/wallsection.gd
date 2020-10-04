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
func _process(_delta):
	if health < 1:
		#emit_signal("destroyed")
		get_parent().visible = false
		call_deferred("free")

func damaged(type):
	if type == "driller":
		health = health - 50
	#if health < threshold:
	# load new image

func destroy():
	pass

func cutter_timeout():
	health = health - 1
	
func stopped_cutter():
	$CutterTimer.stop()
