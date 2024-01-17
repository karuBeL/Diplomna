extends Node

func execute():
	var player = get_tree().get_nodes_in_group("player")[0]
	var state_machine : StateMachine = player.get_node("StateMachine")
	state_machine.transition_to("DashBomb")
