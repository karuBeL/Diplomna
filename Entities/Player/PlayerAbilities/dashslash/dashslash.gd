extends Node

var player
var playerStateMachine : StateMachine
var timer : Timer
var cooldown = 3

func _ready():
	timer = $Timer
	player = get_tree().get_nodes_in_group("player")[0]
	playerStateMachine = player.get_node("StateMachine")

func execute():
	if !timer.is_stopped():
		playerStateMachine.transition_to("Run")
		return
	timer.start(cooldown)
	playerStateMachine.transition_to("DashSlash")
