extends Node2D

signal GameOver
signal GameRestart

var gameOver = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ship_shoot(plasma, direction, location):
	var p1 = plasma.instance()
	p1.position = location
	p1.angular_velocity(direction)
	p1.set_meta('type','shot')
	add_child(p1)

func end_state():
	emit_signal("GameOver")
	print("Endstate reached")

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("restart"):
		gameOver = false
		emit_signal("GameRestart")
