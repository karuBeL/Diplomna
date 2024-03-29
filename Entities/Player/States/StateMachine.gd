extends Node
class_name StateMachine

@export var state : State

func _ready() -> void:
	await owner.ready
	for child in get_children():
		child.state_machine = self
	state.enter()


func _process(delta: float) -> void:
	state.update(delta)

func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		return

	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)

