extends PlayerState

func enter(msg := {}) -> void:
	#player.velocity = Vector3.ZERO
	pass
	
func update(delta: float) -> void:
	var movement_dir = Input.get_vector("move_forwards", "move_backwards", "move_right", "move_left")
	if Input.is_action_just_pressed("ability_1"):
		state_machine.transition_to("executeAbility")
	elif movement_dir != Vector2.ZERO:
		state_machine.transition_to("Run")
