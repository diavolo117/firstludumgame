extends Area2D
@onready var collision = $CollisionShape2D
var healbr = 1
@export var knock = false
@onready var enemy = $".."
var test = 1

func take_damage(damage):
	healbr -= damage
	knock = true
	if healbr <= 0:
		death()
	
func death():
	
	timerdeath()
	
func timerdeath():
	await get_tree().create_timer(1.0).timeout
	enemy.queue_free()
