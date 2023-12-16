extends BombState

@onready var timer = $"../../Timer"

func transition_to_explode():
	state_machine.transition_to("Explode")

func enter(msg := {}) -> void:
	$"../../AnimationPlayer".play("wind_up")
	timer.timeout.connect(transition_to_explode)
	timer.wait_time = 0.6
	timer.start()
