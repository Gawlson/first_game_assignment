extends Node2D
func spawn():
	var m = preload("res://mob.tscn").instantiate()
	%PF.progress_ratio = randf()
	m.global_position = %PF.global_position
	add_child(m)


func _on_timer_timeout() -> void:
	spawn() # Replace with function body.


func _on_player_death() -> void:
	
	%gameover.visible = true
	get_tree().paused = true # Replace with function body.
