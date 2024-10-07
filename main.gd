extends Node2D


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	var loadscene1 = load("res://scenes/lvl1.tscn")
	get_tree().change_scene_to_packed(loadscene1)
