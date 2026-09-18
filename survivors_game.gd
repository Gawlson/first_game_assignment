extends Node2D

var wave = 1
var enemies_spawned = 0
var enemies_per_wave = 10
var boss_spawned = false
var bosses_alive = 0


func spawn():
	if bosses_alive > 0:
		return
	var m = preload("res://mob.tscn").instantiate()
	%PF.progress_ratio = randf()
	m.global_position = %PF.global_position
	
	m.h = 3 + floor(wave / 5)
	m.speed = 300 + floor(wave / 3) * 10
	
	add_child(m)

	enemies_spawned += 1

	if enemies_spawned >= enemies_per_wave:
		next_wave()


func next_wave():
	if bosses_alive > 0:
		return
	
	wave += 1
	enemies_spawned = 0
	enemies_per_wave += 5

	if wave % 5 == 0:
		spawn_bosses()

	%Timer.wait_time = max(0.2, %Timer.wait_time - 0.1)


func spawn_bosses():
	var num_bosses = 1
	
	if wave >= 10:
		num_bosses = 2
	
	if wave >= 15:
		num_bosses = 3
	
	if wave >= 20:
		num_bosses = 4
	
	bosses_alive = num_bosses
	
	for i in range(num_bosses):
		var boss = preload("res://mob.tscn").instantiate()
		
		%PF.progress_ratio = randf()
		boss.global_position = %PF.global_position
		
		add_child(boss)
		
		boss.make_boss(wave)


func boss_defeated():
	bosses_alive -= 1
	
	if bosses_alive <= 0:
		next_wave()


func _on_timer_timeout() -> void:
	spawn()


func _on_player_death() -> void:
	%gameover.visible = true
	get_tree().paused = true
