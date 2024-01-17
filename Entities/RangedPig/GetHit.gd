extends Enemy

@onready var timer : Timer = $"../../Timer"

func enter(msg := {}) -> void:
	if !timer.timeout.is_connected(transition):
		timer.timeout.connect(transition)
	timer.wait_time = 0.2
	timer.start()
	$"../../AnimationTree".set("parameters/get_hit_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func transition():
	state_machine.transition_to("Pursue") 
