extends Node

var player
var playerStateMachine : StateMachine
var timer : SceneTreeTimer

func _ready():
	timer = get_tree().create_timer(0.0)
	player = get_tree().get_nodes_in_group("player")[0]
	playerStateMachine = player.get_node("StateMachine")

func execute():
	if timer.time_left != 0:
		playerStateMachine.transition_to("Run")
		return
	timer.start(3)
	playerStateMachine.transition_to("DashSlash")
