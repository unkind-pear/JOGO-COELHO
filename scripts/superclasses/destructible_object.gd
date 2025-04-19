class_name DestructibleObject
extends Node2D

var damage_receiver
@export var knockback_intensity: float
@export var health: int

enum State {IDLE,DAMAGED}
var state := State.IDLE
var object_sprite
var sprite_position
