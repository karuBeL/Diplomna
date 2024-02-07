extends Node

var collision : ShapeCast3D
var weapon : Node3D
var inAnimation : bool
var playerStateMachine : StateMachine
var timer : Timer



func _ready():
	timer = $Timer
	var player = get_tree().get_nodes_in_group("player")[0]
	collision = player.get_node("WeaponCollision")
	weapon = player.get_node("Weapon")
	playerStateMachine = player.get_node("StateMachine")

func execute():
	if !timer.is_stopped():
		playerStateMachine.transition_to("Run")
		return
	timer.start(1)
	if inAnimation:
		return
	inAnimation = true
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
	tween.connect("finished", disableCollision)

func disableCollision():
	inAnimation = false
	playerStateMachine.transition_to("Run")
