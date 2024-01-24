extends Node

var player
var statemachine : StateMachine
var knockback_coll : Area3D

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	statemachine = player.get_node("StateMachine")
	knockback_coll = player.get_node("Knockback")

func execute():
	var bodies = knockback_coll.get_overlapping_bodies()
	for body : Entity in bodies:
		body.apply_stun(0.5, true)
	statemachine.transition_to("Run")
