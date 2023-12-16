extends PlayerState

var index = 0

func enter(_msg := {}) -> void:
	player.abilities.append(_msg[0])

func physics_update(_delta: float) -> void:
	pass
