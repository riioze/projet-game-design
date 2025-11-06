extends Node
class_name MobControler

const Mob = preload("res://Scripts/mob.gd");

@export var all_mobs = ItemList.new();

func hit_mobs(pos:Vector2, attack_radius:float,attack_damages:float) :
	for mob : Mob in all_mobs:
		var dist = (mob.position-pos).abs();
		if (dist<=attack_radius):
			mob.get_hit(attack_damages)
			
