extends PlayerState

func enter(_msg := {}) -> void:
	var index = _msg.get("index")
	if player.abilities.size() <= index:
		state_machine.transition_to("Run")
		return
	var ability = player.abilities[index]
	ability.execute()
	player.player_ui.set_cooldown(ability.cooldown, index)
	
