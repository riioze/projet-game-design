extends CharacterBody2D
class_name Player


const Mob = preload("res://Scripts/mob.gd");
const MobControler = preload("res://Scripts/mob_controler.gd");

var Max_Speed = 900.0;
var acceleration = 900.0;
var deceleration_factor = 0.9;

@export var number_of_sheels : int = 0;
@export var mob_controler : MobControler;

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO;
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	
	velocity*=deceleration_factor
	
	velocity += input_vector.normalized()*acceleration*delta;
	
	velocity.clampf(0.0,Max_Speed);
	
	rotation = velocity.angle()+PI/2;
	
	move_and_slide();
	


func hit(enemy : Mob):
	enemy.get_hit(10.0);
