extends Node

var player
var playerStateMachine : StateMachine
var timer : SceneTreeTimer

func _ready():
	timer = get_tree().create_timer(0.0)
	player = get_tree().get_nodes_in_group("player")[0]
	playerStateMachine = player.get_node("StateMachine")
	
	#timer.wait_time = 2

func execute():
	if timer.time_left != 0:
		playerStateMachine.transition_to("Run")
		return
	timer = get_tree().create_timer(2)
	playerStateMachine.transition_to("Dash")
