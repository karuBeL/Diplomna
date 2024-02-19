extends EnemyState

@onready var timer : Timer = $"../../GetHitTimer"
var is_dead : bool = false

func enter(_msg := {}) -> void:
	is_dead = false
	apply_damage(_msg.get("dmg_amount"))
	if !timer.timeout.is_connected(transition):
		timer.timeout.connect(transition)
	timer.wait_time = 0.2
	timer.start()
	$"../../AnimationTree".set("parameters/get_hit_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func apply_damage(dmg_amount):
	if enemy.current_health - dmg_amount > 0:
		enemy.current_health -= dmg_amount
	else:
		is_dead = true

func transition():
	if is_dead:
		state_machine.transition_to("Death")
	state_machine.transition_to("Pursue") 
