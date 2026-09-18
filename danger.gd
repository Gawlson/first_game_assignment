extends Area2D

var player_inside = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = false
		body.in_danger_zone = false
		


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = true
		body.in_danger_zone = true
	
