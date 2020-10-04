extends Area2D

signal shoot(plasma, direction, location)

#var Plasma = preload("res://Plasma.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.

#func _input(_event):
#	if Input.is_action_just_pressed("shoot"):
#		emit_signal("shoot", Plasma, global_rotation, global_position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_cannon_tube_shoot(plasma, direction, location):
	emit_signal("shoot", plasma, direction, location)


func _on_RedCannon_body_entered(body):
	pass # Replace with function body.
