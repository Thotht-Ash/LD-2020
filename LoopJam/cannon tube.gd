extends Sprite

signal shoot(plasma, direction, location)

var Plasma = preload("res://Plasma.tscn")
export var firingCooldown = 90
var timeSinceFiring = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
			if timeSinceFiring > firingCooldown:
				emit_signal("shoot", Plasma, global_rotation, global_position)
				timeSinceFiring = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/World/Ship").gameOver == false:
		look_at(get_global_mouse_position())
		rotation += PI/2
	timeSinceFiring += 1


func _on_RedCannon_body_entered(body):
	pass # Replace with function body.


func _on_BlueCannon_body_entered(body):
	pass # Replace with function body.
