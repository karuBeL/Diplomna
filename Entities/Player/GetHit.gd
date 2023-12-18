extends PlayerState

func enter(msg := {}) -> void:
	$"../../AnimatedSprite3D".play("get_hit")
	state_machine.transition_to("Idle")
