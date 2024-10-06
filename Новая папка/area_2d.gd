extends Area2D
@onready var collision = $CollisionShape2D
var healbr = 3
@onready var enemy = $".."
func take_damage(damage):
	healbr -= 1
	if healbr <= 0:
		death()
func death():
	get_node("../AnimationPlayer").play("die")
	timerdeath()
	
func timerdeath():
	await get_tree().create_timer(1.0).timeout
	enemy.queue_free()
