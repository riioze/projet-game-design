extends RigidBody2D
class_name Mob
@export var pv = 150.0;
@export var loot : int = 1;

func get_hit(damages : float):
	pv -= damages;
	if (pv<=0.0):
		free();
