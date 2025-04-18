class_name DestructibleObject
extends Node2D

var damage_receiver
#var velocity
@export var knockback_intensity: float
@export var health: int

enum State {IDLE,DAMAGED}
var state := State.IDLE
var object_sprite
var sprite_position

func _ready() -> void:
	damage_receiver = get_node("DamageReceiver")
	damage_receiver.damage_received.connect(on_receive_damage.bind())
	object_sprite = get_node("SpritePosition/AnimatedSprite2D/AnimationPlayer")
	sprite_position = get_node("SpritePosition")
	##velocity = Vector2.ZERO

	
func on_receive_damage(damage: int,direction: Vector2) -> void:
	health -= damage
	print(health)
	print(direction.x)
	if health <= 0:
		object_sprite.play("destroyed") 
	else:
		if direction.x == 1:
			sprite_position.scale.x = 1
			object_sprite.play("destructing")
		elif direction.x == -1:
			sprite_position.scale.x = -1
			object_sprite.play("destructing")
	
func pop_out() -> void:
	queue_free()

func reset_animation() -> void:
	object_sprite.play("idle")
