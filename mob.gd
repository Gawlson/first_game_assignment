extends CharacterBody2D
@onready var player = get_node("/root/Game/Player")
var h = 3
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*300
	move_and_slide()


func take_damage():
	%Slime.play_hurt()
	h -=1
	if h ==0:
		queue_free()
		const SMOKE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var s = SMOKE.instantiate()
		get_parent().add_child(s)
		s.global_position = global_position
func _ready():
	%Slime.play_walk()
