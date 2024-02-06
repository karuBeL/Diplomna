extends Enemy

@onready var pursue_range : Area3D = $"../../PursueRange"

func inRange(body):
	if body != player:
		return
	print("inRange")
	state_machine.transition_to("Pursue")

func enter(msg := {}) -> void:
	$"../../AnimationTree".set("parameters/idle_pursue_stunned/blend_amount", 0)
	if msg.has("attack"):
		state_machine.transition_to("Attack")
	elif !pursue_range.body_entered.is_connected(inRange):
		pursue_range.body_entered.connect(inRange)

