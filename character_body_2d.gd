extends CharacterBody2D

var SPEED = -50.0
var faceright = false
@onready var aread = $Area2D
func _physics_process(delta: float) -> void:
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = SPEED
	move_and_slide()
	
	
func flip():
	faceright = !faceright
	scale.x = abs(scale.x) * -1
	if faceright:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1
