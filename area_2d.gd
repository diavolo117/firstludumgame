
extends Area2D
@onready var collision = $CollisionShape2D
var healbr = 3
@export var havehit = false
@onready var enemy = $".."


func take_damage(damage):
	healbr -= damage
	
	if healbr <= 0:
		death()
	

func death():

	timerdeath()
	
func timerdeath():
	await get_tree().create_timer(1.0).timeout
	enemy.queue_free()
