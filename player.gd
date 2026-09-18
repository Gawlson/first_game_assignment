extends CharacterBody2D

var health = 100.0
var max_health = 100.0
signal death
var xp = 0
var kills = 0
var in_danger_zone = false




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
	%LevelLabel.text = "Level: %d   Kills: %d" % [level, kills]
	#print("Enemies detected: ", overlap.size())
	if overlap.size()>0:
		health -= 10.0*overlap.size()*delta
		%ProgressBar.value = health
		
		if health <=0.0:
			
			death.emit()
		
	if in_danger_zone:
		health -= 10.0*delta
		%ProgressBar.value = health
		if health <=0.0:
			death.emit()



func _on_death() -> void:
	pass # Replace with function body.

var level = 1
var xp_to_next_level = 10

func add_xp(n):
	xp+=n
	#%XPLabel.text = "XP: %d" % xp
	if xp >= xp_to_next_level:
		level_up()

func level_up():
	level += 1
	xp = 0
	xp_to_next_level += 5  # each level needs a bit more XP
	%LevelLabel.text = "Level: %d" % level
	max_health += 10
	health = max_health
	%ProgressBar.value = health


func _on_danger_body_entered(body: Node2D) -> void:
	pass


func _on_danger_body_exited(body: Node2D) -> void:
	pass
