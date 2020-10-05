extends Label


var score = 0
var scoring = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scoring == true:
		score += 1
	text = "Score: " + String(score/100)

func _input(event):
	if Input.is_action_pressed("restart"):
		score = 0
		scoring = true

func _on_World_GameOver():
	scoring = false
