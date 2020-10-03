extends Node2D

signal shoot(plasma, direction, location)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("rotate_clockwise"):
		rotation -= 0.01
	if Input.is_action_pressed("rotate_counter"):
		rotation += 0.01


func _on_BlueCannon_shoot(Plasma, direction, location):
	emit_signal("shoot", Plasma, direction, location)


func _on_RedCannon_shoot(Plasma, direction, location):
	emit_signal("shoot", Plasma, direction + PI, location)
