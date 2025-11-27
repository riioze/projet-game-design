extends CharacterBody2D
class_name Player
@export var GRAVITY = 200.0
@export var WALK_SPEED = 200

var sprite : Sprite2D

func _ready() -> void:
	sprite = $sprite

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		sprite.flip_h = true
		
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		sprite.flip_h = false
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
