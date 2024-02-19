extends EnemyState

@onready var timer : Timer = $"../../GetHitTimer"

func enter(_msg := {}) -> void:
	if apply_damage(_msg.get("dmg_amount")):
		return
	if !timer.timeout.is_connected(transition):
		timer.timeout.connect(transition)
	timer.wait_time = 0.2
	timer.start()
	$"../../AnimationTree".set("parameters/get_hit_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func apply_damage(dmg_amount):
	if enemy.current_health - dmg_amount > 0:
		enemy.current_health -= dmg_amount
	else:
		state_machine.transition_to("Death")
		return 1

func transition():
	state_machine.transition_to("Pursue") 
