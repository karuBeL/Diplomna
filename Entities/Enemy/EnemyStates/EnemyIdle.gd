extends Enemy

var range : Area3D 

func inRange(body):
	print("inRange")
	$"../../AnimationPlayer".play("")
	state_machine.transition_to("Pursue")

func enter(msg := {}) -> void:
	$"../../AnimationPlayer".play("idle")
	range = $"../../PursueRange" as Area3D
	range.body_entered.connect(inRange)
	#range.connect("area_entered", inRange)

func update(delta: float) -> void:
	pass

