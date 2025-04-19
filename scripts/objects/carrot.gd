extends Area2D

func _ready() -> void:
	connect("body_entered",Callable(self,"_on_body_entered"))
	
func _on_body_entered(body):
	print("cenoura coletada")
	if body.health <= 95:
		body.health += 5
	else:
		body.health += (100 - body.health) 
	print(body.health)
	queue_free()
