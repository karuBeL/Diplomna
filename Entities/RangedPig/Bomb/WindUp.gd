extends BombState

@onready var timer : Timer = $"../../Timer"

func transition_to_explode():
	state_machine.transition_to("Explode")

func enter(_msg := {}) -> void:
	$"../../AnimationPlayer".play("wind_up")
	timer.timeout.connect(transition_to_explode)
	timer.start(1.3)
