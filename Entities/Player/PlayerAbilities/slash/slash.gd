extends Node

var collision : ShapeCast3D
var weapon : Node3D
var inAnimation : bool
var playerStateMachine : StateMachine

func _ready():
	var player = get_tree().get_nodes_in_group("player")[0]
	collision = player.get_node("WeaponCollision")
	weapon = player.get_node("Weapon")
	playerStateMachine = player.get_node("StateMachine")

func execute():
	
	if inAnimation:
		return
	inAnimation = true
	collision.get_collisions()
	tween1(weapon)
	#tween.tween_method(weapon.rotate_y.bind(), -PI/2, PI/2, 0.001)

func tween1(weapon : Node3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/1.5, 0.04)
	tween.connect("finished", tween2.bind(weapon))

func tween2(weapon : Node3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*-PI*4/3, 0.20)
	tween.connect("finished", tween3.bind(weapon))

func tween3(weapon : Node3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/1.5, 0.04)
	tween.connect("finished", disableCollision)

func disableCollision():
	inAnimation = false
	playerStateMachine.transition_to("Run")
