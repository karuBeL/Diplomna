extends Node

var collision : ShapeCast3D
var weapon : Node3D
var playerStateMachine : StateMachine
var cooldown_timer : Timer
var move_left
var move_right
var left_duration = 0.05
var right_duration = 0.15
var origin_duration = 0.05
var original_position
var cooldown = 1

func _ready():
	cooldown_timer = $Timer
	var player = get_tree().get_nodes_in_group("player")[0]
	collision = player.get_node("WeaponCollision")
	weapon = player.get_node("Weapon")
	playerStateMachine = player.get_node("StateMachine")
	move_left = Vector3.UP * PI/2
	move_right = -Vector3.UP * PI/2
	original_position = weapon.rotation

func execute():
	if !cooldown_timer.is_stopped():
		playerStateMachine.transition_to("Run")
		return
	cooldown_timer.start(cooldown)
	collision.get_collisions()
	slash_animation()
	

func slash_animation():
	var tween = create_tween()
	tween.tween_property(weapon, "rotation", weapon.rotation + move_left, left_duration)
	tween.tween_property(weapon, "rotation",weapon.rotation + move_right, right_duration)
	tween.tween_property(weapon, "rotation", weapon.rotation, origin_duration)
	tween.connect("finished", transition_to_run)

func tween1():
	var tween = get_tree().create_tween()
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
