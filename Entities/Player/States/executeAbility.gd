extends PlayerState

var index = 0
func enter(_msg := {}) -> void:
	index = _msg.get("index")
	if player.abilities.size() <= index:
		state_machine.transition_to("Run")
		return
	player.abilities[index].execute()
	#state_machine.transition_to("Run")
	
