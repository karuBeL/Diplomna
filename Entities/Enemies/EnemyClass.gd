extends CharacterBody3D
class_name EnemyClass

var current_health : int = 100
var speed : int = 5
var attack_distance : int
var state_machine : StateMachine
var nav_agent : NavigationAgent3D 
var player : PlayerClass
var pursue_range : Area3D
var animation_tree : AnimationTree
var sprite : Sprite3D
var wait_time_gen 

func get_hit(damage_amount):
	state_machine.transition_to("GetHit", {"dmg_amount": damage_amount})

func apply_knockback(stun_amount : float):
	var msg := {"time" : stun_amount}
	state_machine.transition_to("Stunned", msg)

