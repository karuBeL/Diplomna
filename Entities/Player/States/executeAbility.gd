extends PlayerState

func enter(_msg := {}) -> void:
	var index = _msg.get("index")
	if player.abilities.size() <= index:
		state_machine.transition_to("Run")
		return
	player.abilities[index].execute()
	
