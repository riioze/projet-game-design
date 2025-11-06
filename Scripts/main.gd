extends Node2D

const MobController = preload("res://Scripts/mob_controler.gd");
const Player = preload("res://Scripts/player.gd");
const Mob = preload("res://Scripts/mob.gd")
const mob_scene = preload("res://mob.tscn")

@export var mob_controller = MobController.new();
@export var player : Player;

func _init() -> void:
	mob_controller.add_child(mob_scene.instanciate());
