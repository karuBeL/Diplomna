extends PlayerState

func update(_delta: float) -> void:
	var movement_dir = Input.get_vector("move_forward", "move_backward", "move_right", "move_left")
	if Input.is_action_just_pressed("ability_1"):
		state_machine.transition_to("executeAbility", {"index" : 0})
	elif Input.is_action_just_pressed("ability_2"):
		state_machine.transition_to("executeAbility", {"index" : 1})
	elif Input.is_action_just_pressed("ability_3"):
		state_machine.transition_to("executeAbility", {"index" : 2})
	elif movement_dir != Vector2.ZERO:
		state_machine.transition_to("Run")

