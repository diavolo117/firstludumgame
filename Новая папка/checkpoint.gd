extends Node2D
class_name checkpoint
@export var spawnpoint = false
var active = false
func activate():
	Gameload.currentcheck = self
	active = true
	$AnimationPlayer.play("reachcheck")
	

func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent() is Player && !active:
		activate()
		
		
		
