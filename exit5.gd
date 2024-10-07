extends Area2D
func _on_area_entered(area: Area2D):
	if area.get_parent() is Player:
		print(1)
		var loadscene1 = load("res://scenes/lvl5.tscn")
		get_tree().change_scene_to_packed(loadscene1)
