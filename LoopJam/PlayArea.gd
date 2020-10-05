extends Area2D

signal destroy
export var highscore = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayArea_body_exited(body):
	if "Bouncer" in body.name or "Driller" in body.name:
		if body.global_position.x > 0 and body.global_position.x < 1024 and body.global_position.y > 0 and body.global_position.y < 600 and not get_parent().gameOver:
			highscore += 1
			print(highscore)
	if "Plasma" in body.name:
		connect("destroy", body, "cleanup")
		emit_signal("destroy")
		disconnect("destroy", body, "cleanup")
	else:
		connect("destroy", body, "destroy")
		emit_signal("destroy")
		disconnect("destroy", body, "destroy")
