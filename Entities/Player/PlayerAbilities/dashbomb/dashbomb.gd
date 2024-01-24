extends Node

var player
var playerStateMachine : StateMachine
var hit_timer : SceneTreeTimer

func _ready():
	#hit_timer = get_tree().create_timer(0.0)
	player = get_tree().get_nodes_in_group("player")[0]
	playerStateMachine = player.get_node("StateMachine")
	#timer.wait_time = 5

func execute():
	#if hit_timer.time_left != 0:
		#playerStateMachine.transition_to("Run")
		#return
	#hit_timer = get_tree().create_timer(5)
	playerStateMachine.transition_to("DashBomb")
