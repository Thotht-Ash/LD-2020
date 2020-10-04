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
func _process(_delta):
	if health < 1:
		call_deferred("free")

func damaged(type):
	print("A Driller hit")
	if type == "driller":
		health = health - 50
	if type == "cutter":
		health = health - 1
		$CutterTimer.connect("timeout", self, "cutter_timeout")
		$CutterTimer.start()
	#if health < threshold:
	# load new image



func cutter_timeout():
	health = health - 1
	
func stopped_cutter():
	$CutterTimer.stop()
