extends CharacterBody2D

var Player = preload("res://Scripts/player.gd")

const SPEED = 100.0

@export var player : Player
@export var GRAVITY = 400.0
@export var ATTACK_RANGE = 100.0
@export var ATTACK_TIME = 1.0

@export var damages = 5.0

var is_attacking = false
var current_cooldown = 0.0

func _process(delta: float) -> void:
	if ((position - player.position).length() < ATTACK_RANGE and not is_attacking):
		is_attacking = true
		current_cooldown = ATTACK_TIME
		player.life -= damages
	else:
		current_cooldown -= delta
		if current_cooldown <= 0:
			is_attacking = false
			current_cooldown = 0.0

func _physics_process(delta: float) -> void:
	velocity.x = 0

	if is_on_floor():

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var diff = position - player.position


		var direction := -diff.clamp(Vector2(-1,0), Vector2(1,0))



		if direction:
			velocity += direction * SPEED

	
	
	move_and_slide()
