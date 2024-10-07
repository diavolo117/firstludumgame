extends Node2D
func _on_area_2d_area_entered(area: Area2D):
	if area.get_parent() is Player && area.is_in_group("hitbox") == false:
		area.get_parent().ded()
