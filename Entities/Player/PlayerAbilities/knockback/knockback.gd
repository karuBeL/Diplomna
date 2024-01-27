extends Node

var player
var statemachine : StateMachine
var knockback_coll : Area3D
var knockback_anim : AnimationPlayer

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	statemachine = player.get_node("StateMachine")
	knockback_coll = player.get_node("Knockback")
	knockback_anim = player.get_node("AnimationPlayer")
	
func execute():
	var bodies = knockback_coll.get_overlapping_bodies()
	knockback_anim.play("knockback")
	for body : Entity in bodies:
		body.apply_stun(0.5, true)
	statemachine.transition_to("Run")
