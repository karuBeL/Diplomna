extends EnemyState

@onready var knockback_timer : Timer = $"../../KnockbackTimer"
@onready var after_timer : Timer = $"../../AfterAttackTimer" as Timer
@onready var stun_timer : Timer = $"../../StunTimer"
var is_knockback : bool
var player_pos : Vector3
var enemy_pos : Vector3
var knockback_direction
var distance 
var stun_secs
var knockback_secs = 0.5
var stop_moving = false
var knockback_velocity
const knockback_speed = 10

func enter(msg := {}) -> void:
	if !knockback_timer.timeout.is_connected(stun_duration):
		knockback_timer.timeout.connect(stun_duration)
		stun_timer.timeout.connect(transition_to_pursue)
	after_timer.paused = true
	stun_secs = msg.get("time")
	knockback_timer.start(knockback_secs)
	get_knockback_velocity()
	$"../../AnimationTree".set("parameters/idle_pursue_stunned/blend_amount", -1)
	

func get_knockback_velocity():
	player_pos = player.global_position
	enemy_pos = enemy.global_position
	enemy.velocity = Vector3.ZERO
	distance = enemy_pos.distance_to(player_pos)
	if distance < 1:
		distance = 1
	knockback_direction = (enemy_pos - player_pos).normalized()
	knockback_velocity = knockback_direction * (knockback_speed / distance) * Vector3(1, 0, 1)
	enemy.nav_agent.avoidance_enabled = false

func stun_duration():
	stop_moving = true
	stun_timer.start(stun_secs)

func transition_to_pursue():
	stop_moving = false
	state_machine.transition_to("Pursue")

func physics_update(_delta: float) -> void:
	if stop_moving == true:
		return
	enemy.velocity = knockback_velocity
	enemy.move_and_slide()
