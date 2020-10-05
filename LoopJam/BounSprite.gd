extends Sprite


# Declare member variables here. Examples:
# var a = 2
var rotationSpeed


# Called when the node enters the scene tree for the first time.
func _ready():
	rotationSpeed = rand_range(-PI/360,PI/360)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotationSpeed
