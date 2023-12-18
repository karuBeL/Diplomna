extends Enemy

func enter(msg := {}) -> void:
	$"../../AnimationTree".set("parameters/get_hit_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	state_machine.transition_to("Pursue")
