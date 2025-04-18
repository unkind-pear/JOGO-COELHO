extends Node2D

var coelho1
var camera

func _ready() -> void:
	coelho1 = get_node("actors_container/coelho1")
	camera = get_node("camera")
	
func _process(delta: float) -> void:
	if coelho1.position.x > camera.position.x:
		camera.position.x = coelho1.position.x
	
