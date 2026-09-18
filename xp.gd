extends Area2D

var time = 0

func _ready():
	queue_redraw()

func _process(delta):
	time += delta
	
	if time >= 10:
		queue_free()

func _draw():
	draw_circle(Vector2.ZERO, 15, Color(0.4, 1.0, 0.6))

func _on_body_entered(body):
	if body.name == "Player" or body.is_in_group("player"):
		body.add_xp(1)
		queue_free()
