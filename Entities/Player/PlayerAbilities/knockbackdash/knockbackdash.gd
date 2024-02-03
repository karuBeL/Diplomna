extends Node

var player : EntityClass
var statemachine : StateMachine
var knockback_coll : Area3D
var knockback_anim : AnimationPlayer
var timer : Timer
var buff_timer : Timer
var old_speed

func _ready():
	timer = $Timer as Timer
	buff_timer = $BuffDuration as Timer
	buff_timer.timeout.connect(revert_speed)
	player = get_tree().get_nodes_in_group("player")[0] as EntityClass
	statemachine = player.get_node("StateMachine")
	knockback_coll = player.get_node("Knockback")
	knockback_anim = player.get_node("AnimationPlayer")
	old_speed = player.speed

func execute():
	if timer.time_left != 0:
		statemachine.transition_to("Run")
		return
	timer.start(5)
	var bodies = knockback_coll.get_overlapping_bodies()
	knockback_anim.play("knockback")
	buff_timer.start(3)
	player.speed += 3
	for body : EntityClass in bodies:
		player.speed += 1
		body.apply_stun(0.5, true)
	statemachine.transition_to("Run")

func revert_speed():
	print("reverted")
	player.speed = old_speed
