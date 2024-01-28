extends PlayerState

var index = 0
func enter(_msg := {}) -> void:
	player.load_ability("dash")
	player.load_ability("slashbomb")#Testing abilities
	index = _msg.get("index")
	player.abilities[index].execute()
	#state_machine.transition_to("Run")
	
