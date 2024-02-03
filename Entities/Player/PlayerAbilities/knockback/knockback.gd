extends Node

var player
var statemachine : StateMachine
var knockback_coll : Area3D
var knockback_anim : AnimationPlayer
var timer : Timer

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	statemachine = player.get_node("StateMachine")
	knockback_coll = player.get_node("Knockback")
	knockback_anim = player.get_node("AnimationPlayer")
	timer = $Timer as Timer
	
func execute():
	if timer.time_left != 0:
		statemachine.transition_to("Run")
		return
	timer.start()
	var bodies = knockback_coll.get_overlapping_bodies()
	knockback_anim.play("knockback")
	for body : EntityClass in bodies:
		body.apply_stun(0.5, true)
	statemachine.transition_to("Run")
