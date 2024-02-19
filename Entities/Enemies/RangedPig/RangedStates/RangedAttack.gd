extends EnemyState

@onready var attack_timer = $"../../AttackTimer" as Timer
@onready var after_timer = $"../../AfterAttackTimer" as Timer

func startAfterTimer():
	after_timer.start()

func enter(_msg := {}):
	if !after_timer.is_connected("timeout", transition):
		after_timer.timeout.connect(transition)
	if !attack_timer.is_stopped():
		state_machine.transition_to("Pursue")
		return
	attack_timer.start()
	after_timer.paused = false
	$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
func transition():
	state_machine.transition_to("Pursue")
