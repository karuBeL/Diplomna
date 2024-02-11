extends Enemy

@onready var timer : Timer = $"../../StunTimer"
@onready var after_timer : Timer = $"../../AfterAttackTimer" as Timer
var is_knockback : bool
var player_pos : Vector3
var enemy_pos : Vector3


func enter(msg := {}) -> void:
	if !timer.timeout.is_connected(transition):
		timer.timeout.connect(transition)
	after_timer.paused = true
	var stun_secs = msg.get("time")
	is_knockback = msg.get("knockback")
	player_pos = player.global_position
	enemy_pos = enemy.global_position
	enemy.velocity = Vector3.ZERO
	timer.start(stun_secs)
	$"../../AnimationTree".set("parameters/idle_pursue_stunned/blend_amount", -1)
	if is_knockback == true:
		knockback()
	

func knockback():
	var knockback_direction = (enemy_pos - player_pos).normalized()
	var distance = enemy_pos.distance_to(player_pos)
	if distance < 1:
		distance = 1
	enemy.nav_agent.avoidance_enabled = false
	enemy.velocity = knockback_direction * (10 / distance) * Vector3(1, 0, 1)
	enemy.move_and_slide()
	
func transition():
	if is_knockback:
		timer.start(1)
		is_knockback = false
	else:
		state_machine.transition_to("Pursue")

func physics_update(_delta: float) -> void:
	if is_knockback == true:
		knockback()
