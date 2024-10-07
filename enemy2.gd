extends CharacterBody2D


var SPEED = -20.0

var faceright = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = SPEED
	
func flip():
	faceright = !faceright
	scale.x = abs(scale.x) * -1
	if faceright:
		SPEED = abs(SPEED)
	else:
		SPEED = abs(SPEED) * -1
