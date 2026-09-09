extends Area2D
func _physics_process(delta):
	var enemies = get_overlapping_bodies()
	if enemies.size()>0:
		var target = enemies.front()
		look_at(target.global_position)
func shoot():
	const B = preload("res://bullet.tscn")
	var spread = 4
	var new_bullet = B.instantiate()
	var b2 =  B.instantiate()
	var b3 =  B.instantiate()
	new_bullet.global_position = %point.global_position
	new_bullet.global_rotation = %point.global_rotation
	b2.global_position = %point.global_position
	b2.global_rotation = %point.global_rotation  + deg_to_rad(spread)
	b3.global_position = %point.global_position
	b3.global_rotation = %point.global_rotation -  deg_to_rad(spread)

	%point.add_child(new_bullet)
	%point.add_child(b2)
	%point.add_child(b3)


	 # Replace with function body.
