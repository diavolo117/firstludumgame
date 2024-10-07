extends Node
var currentcheck : checkpoint
var player : Player
func respawn():
	if currentcheck != null:
		get_tree().reload_current_scene()
