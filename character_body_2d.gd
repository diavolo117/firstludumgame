extends CharacterBody2D
var SPEED = -40.0
var faceright = false
var knockback
var knockbacktrue
var wherego = -1
@onready var aread = $Area2D
var knocktrue
var playerdir

func _physics_process(delta: float) -> void:
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	if $RayCast2D2.is_colliding():
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



func _on_area_2d_2_area_entered(area: Area2D):
		if area.get_parent() is Player:
			area.get_parent().ded()
	
