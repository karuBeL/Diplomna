extends Player

var index = 0
func enter(_msg := {}) -> void:
	player.load_ability("slash")#Testing abilities
	index = 0 #index = _msg[0]

func physics_update(_delta: float) -> void:
	player.abilities[0].execute($"../../Weapon", $"../../WeaponCollision")
	state_machine.transition_to("Run")
