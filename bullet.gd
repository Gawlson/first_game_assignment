extends Area2D
var dist = 0
func _physics_process(delta):
	const S = 1000
	const R = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position+= direction*S *delta
	dist = S*delta
	if dist>R:
		queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	queue_free() # Replace with function body.
	if body.has_method("take_damage"):
		body.take_damage()
