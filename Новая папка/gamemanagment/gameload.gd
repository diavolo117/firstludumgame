extends Node
var currentcheck : checkpoint
var player : Player
func respawn():
	if currentcheck != null:
		player.position = currentcheck.global_position
