extends Enemy

@onready var timer : Timer = $"../../GetHitTimer"

func enter(_msg := {}) -> void:
	if !timer.timeout.is_connected(transition):
		timer.timeout.connect(transition)
	timer.start(0.2)
	$"../../AnimationTree".set("parameters/get_hit_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func transition():
	state_machine.transition_to("Pursue") 
