extends Area2D

var time = 0

func _ready():
	queue_redraw()

func _process(delta):
	time += delta
	
	if time >= 10:
		queue_free()

func _draw():
	draw_rect(Rect2(-5, -15, 10, 30), Color(1.0, 0.2, 0.2))
	draw_rect(Rect2(-15, -5, 30, 10), Color(1.0, 0.2, 0.2))

func _on_body_entered(body):
	if body.name == "Player" or body.is_in_group("player"):
		body.health = min(body.health + 25, body.max_health)
		body.get_node("ProgressBar").value = body.health
		queue_free()
