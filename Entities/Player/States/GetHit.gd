extends PlayerState


func enter(_msg := {}) -> void:
	$"../../AnimatedSprite3D".play("get_hit")
	state_machine.transition_to("Run")
	
