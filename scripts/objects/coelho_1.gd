class_name Coelho1
extends Character

@export var jump_intensity: float
var height := 0
var height_speed = 200 #colocar o mesmo valor na funcao handle_air_time
const GRAVITY := 600.0

func _process(delta: float) -> void:
	handle_input()
	handle_movement()
	handle_animations()
	handle_air_time(delta)
	flip_sprites()
	character_sprite.position = Vector2.UP * height
	move_and_slide()
	
func handle_movement() -> void:
	if can_move():
		if velocity.length() == 0:
			state = State.IDLE
		else:
			state = State.WALK
	else:
		velocity = Vector2.ZERO
	

func handle_input() -> void:
	var direction := Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction*speed	
	if can_attack() and Input.is_action_just_pressed("attack"):
		state = State.ATTACK
	if can_jump() and Input.is_action_just_pressed("jump"):
		state = State.JUMP

func handle_air_time(delta:float) -> void:
	if state == State.JUMP:
		height += height_speed*delta
		print(height_speed)
		if height < 0:
			height = 0
			height_speed = 200
			state = State.LAND
		else:
			height_speed -= GRAVITY*delta

func can_jump() -> bool:
	return state == State.IDLE or state == State.WALK

func on_takeoff_complete() -> void:
	state = State.JUMP
	height_speed = jump_intensity
	
func on_land_complete() -> void:
	state = State.IDLE
