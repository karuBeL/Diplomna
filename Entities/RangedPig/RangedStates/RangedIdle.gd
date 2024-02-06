extends Enemy

@onready var range : Area3D = $"../../PursueRange"

func inRange(body):
	if body != player:
		return
	state_machine.transition_to("Pursue")

func enter(_msg := {}) -> void:
	$"../../AnimationTree".set("parameters/Idle_Pursue/blend_amount", 0)
	if _msg.has("attack"):
		state_machine.transition_to("Attack")
	elif !range.body_entered.is_connected(inRange):
		range.body_entered.connect(inRange)
