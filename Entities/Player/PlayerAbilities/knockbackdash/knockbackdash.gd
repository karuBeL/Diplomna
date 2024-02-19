extends Node

var player : PlayerClass
var playerStateMachine : StateMachine
var knockback_coll : Area3D
var knockback_anim : AnimationPlayer
var cooldown_timer : Timer
var buff_timer : Timer
var old_speed
var base_speed_boost = 3
var bonus_speed_boost = 1

func _ready():
	cooldown_timer = $Timer as Timer
	buff_timer = $BuffTimer as Timer
	buff_timer.timeout.connect(revert_speed)
	player = get_tree().get_nodes_in_group("player")[0] as PlayerClass
	playerStateMachine = player.get_node("StateMachine")
	knockback_coll = $KnockbackCollision
	knockback_anim = $AnimationPlayer
	old_speed = player.speed

func execute():
	if !cooldown_timer.is_stopped():
		playerStateMachine.transition_to("Run")
		return
	cooldown_timer.start(5)
	var bodies = knockback_coll.get_overlapping_bodies()
	knockback_anim.play("knockback")
	buff_timer.start(3)
	player.speed += base_speed_boost
	for body : EnemyClass in bodies:
		player.speed += bonus_speed_boost
		body.apply_stun(0.5, true)
	playerStateMachine.transition_to("Run")

func revert_speed():
	player.speed = old_speed
