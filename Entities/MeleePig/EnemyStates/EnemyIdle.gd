extends Enemy

@onready var range : Area3D = $"../../PursueRange"

func inRange(body):
	if body != player:
		return
	print("inRange")
	state_machine.transition_to("Pursue")

func enter(msg := {}) -> void:
	$"../../AnimationTree".set("parameters/Idle_Pursue/blend_amount", 0)
	if msg.has("attack"):
		state_machine.transition_to("Attack")
	elif !range.body_entered.is_connected(inRange):
		range.body_entered.connect(inRange)
	#range.connect("area_entered", inRange)

func update(delta: float) -> void:
	pass

