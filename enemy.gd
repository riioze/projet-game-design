extends CharacterBody2D

var Player = preload("res://Scripts/player.gd")

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@export var player : Player

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta


	velocity.x = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var diff = position - player.position
	var direction := -diff.clamp(Vector2(-1,0), Vector2(1,0))
	
	if direction:
		velocity +=direction * SPEED

	move_and_slide()
