extends CharacterBody2D
@onready var player = get_node("/root/Game/Player")
var h = 3
var speed = 300
var is_boss = false

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*speed
	move_and_slide()


func take_damage():
	%Slime.play_hurt()
	h -=1
	if h <=0:
		die()
	
func _ready():
	%Slime.play_walk()

func die():
	drop_xp()
	
	if not is_boss:
		player.kills += 1
	
	if is_boss:
		get_parent().boss_defeated()
	
	const SMOKE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var s = SMOKE.instantiate()
	get_parent().add_child(s)
	s.global_position = global_position
	queue_free()
func drop_xp():
	var num = randi_range(1, 3)
	
	if is_boss:
		num = randi_range(15, 25)
	
	for i in range(num):
		var xp = preload("res://xp.tscn").instantiate()
		var offset = Vector2(randf_range(-50, 50), randf_range(-50, 50))
		get_parent().add_child(xp)
		xp.global_position = global_position + offset
	
	if randf() < 0.2:
		var health = preload("res://health.tscn").instantiate()
		get_parent().add_child(health)
		health.global_position = global_position
		
func make_boss(wave):
	is_boss = true
	h = 50 + wave * 5
	speed = 175 + wave * 5
	scale = Vector2(4, 4)
