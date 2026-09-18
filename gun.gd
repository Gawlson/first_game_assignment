extends Area2D

func _physics_process(delta):
	var enemies = get_overlapping_bodies()
	
	look_at(get_global_mouse_position())


func shoot():
	const B = preload("res://bullet.tscn")
	
	var player = get_parent()
	var level = player.level
	
	var new_bullet = B.instantiate()
	get_tree().current_scene.add_child(new_bullet)
	new_bullet.global_position = %point.global_position
	new_bullet.global_rotation = %point.global_rotation
	
	if level >= 2:
		var b2 = B.instantiate()
		get_tree().current_scene.add_child(b2)
		b2.global_position = %point.global_position
		b2.global_rotation = %point.global_rotation + deg_to_rad(8)
	
	if level >= 3:
		var b3 = B.instantiate()
		get_tree().current_scene.add_child(b3)
		b3.global_position = %point.global_position
		b3.global_rotation = %point.global_rotation - deg_to_rad(8)
	
	if level >= 4:
		var b4 = B.instantiate()
		get_tree().current_scene.add_child(b4)
		b4.global_position = %point.global_position
		b4.global_rotation = %point.global_rotation + deg_to_rad(16)
	
	if level >= 5:
		var b5 = B.instantiate()
		get_tree().current_scene.add_child(b5)
		b5.global_position = %point.global_position
		b5.global_rotation = %point.global_rotation - deg_to_rad(16)
	
	if level >= 6:
		var b6 = B.instantiate()
		get_tree().current_scene.add_child(b6)
		b6.global_position = %point.global_position
		b6.global_rotation = %point.global_rotation + deg_to_rad(24)
	
	if level >= 7:
		var b7 = B.instantiate()
		get_tree().current_scene.add_child(b7)
		b7.global_position = %point.global_position
		b7.global_rotation = %point.global_rotation - deg_to_rad(24)
