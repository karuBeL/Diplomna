extends Enemy

@onready var pursue_range : Area3D = $"../../PursueRange"
@onready var anim_tree : AnimationTree = $"../../AnimationTree"

func inRange(body):
	if body != player:
		return
	print("inRange")
	state_machine.transition_to("Pursue")

func enter(_msg := {}) -> void:
	anim_tree.set("parameters/idle_pursue_stunned/blend_amount", 0)
	if !pursue_range.body_entered.is_connected(inRange):
		pursue_range.body_entered.connect(inRange)

