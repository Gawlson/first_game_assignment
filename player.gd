extends CharacterBody2D

var health = 100.0
signal death

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		%Gun.shoot()
		await get_tree().create_timer(0.2).timeout
		%Gun.shoot()
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length()>0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()
	var overlap = %Hurtbox.get_overlapping_bodies()
	print("Enemies detected: ", overlap.size())
	if overlap.size()>0:
		health -= 5.0*overlap.size()*delta
		%ProgressBar.value = health
		
		if health <=0.0:
			
			death.emit()
		




func _on_death() -> void:
	pass # Replace with function body.
