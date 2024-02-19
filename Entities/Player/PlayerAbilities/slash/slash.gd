extends Node

var collision : ShapeCast3D
var weapon : Node3D
var playerStateMachine : StateMachine
var cooldown_timer : Timer

func _ready():
	cooldown_timer = $Timer
	var player = get_tree().get_nodes_in_group("player")[0]
	collision = player.get_node("WeaponCollision")
	weapon = player.get_node("Weapon")
	playerStateMachine = player.get_node("StateMachine")

func execute():
	if !cooldown_timer.is_stopped():
		playerStateMachine.transition_to("Run")
		return
	cooldown_timer.start(1)
	collision.get_collisions()
	tween1()

func tween1():
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/1.5, 0.04)
	tween.connect("finished", tween2)

func tween2():
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*-PI*4/3, 0.20)
	tween.connect("finished", tween3)

func tween3():
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/1.5, 0.04)
	tween.connect("finished", transition_to_run)

func transition_to_run():
	playerStateMachine.transition_to("Run")
