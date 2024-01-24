extends PlayerState

var index = 0
func enter(_msg := {}) -> void:
	player.load_ability("knockback")
	player.load_ability("slash")#Testing abilities
	index = _msg.get("index")
	player.abilities[index].execute()
	#state_machine.transition_to("Run")
	
