extends Node2D

signal shoot(plasma, direction, location)

var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if gameOver == false:
		if Input.is_action_pressed("rotate_clockwise"):
			rotation -= 0.01
		if Input.is_action_pressed("rotate_counter"):
			rotation += 0.01

func _on_BlueCannon_shoot(Plasma, direction, location):
	if gameOver == false:
		emit_signal("shoot", Plasma, direction - PI/2, location)

func _on_RedCannon_shoot(Plasma, direction, location):
	if gameOver == false:
		emit_signal("shoot", Plasma, direction - PI/2, location)

func _on_World_GameOver():
	gameOver = true

func _on_World_GameRestart():
	gameOver = false
