extends Node

var player
var playerStateMachine : StateMachine
var knockback_coll : Area3D
var knockback_anim : AnimationPlayer
var cooldown_timer : Timer

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	playerStateMachine = player.get_node("StateMachine")
	knockback_coll = $KnockbackCollision
	knockback_anim = $AnimationPlayer
	cooldown_timer = $Timer as Timer
	
func execute():
	if !cooldown_timer.is_stopped(): 
		playerStateMachine.transition_to("Run")
		return
	cooldown_timer.start()
	var bodies = knockback_coll.get_overlapping_bodies()
	knockback_anim.play("knockback")
	for body : EnemyClass in bodies:
		body.apply_knockback(0.5)
	playerStateMachine.transition_to("Run")
