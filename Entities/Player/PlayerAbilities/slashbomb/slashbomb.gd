extends Node3D

var collision : ShapeCast3D
var weapon : Node3D
var playerStateMachine : StateMachine
var timer : Timer
var bomb_collision : Area3D
var sword_model : Node3D
var bodies
var bomb_damage = 20 
var anim_player : AnimationPlayer

func _ready():
	bomb_collision = $Area3D
	anim_player = $AnimationPlayer
	timer = $Timer
	var player = get_tree().get_nodes_in_group("player")[0]
	collision = player.get_node("WeaponCollision")
	weapon = player.get_node("Weapon")
	playerStateMachine = player.get_node("StateMachine")
	sword_model = player.get_node("Weapon/Sword")

func explode():
	for body in bodies:
		body.get_hit(bomb_damage)

func execute():
	if timer.time_left != 0:
		playerStateMachine.transition_to("Run")
		return
	timer.start(4)
	bodies = bomb_collision.get_overlapping_bodies()
	global_position = sword_model.global_position
	anim_player.play("explode")
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
