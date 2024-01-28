extends Node3D

var collision : ShapeCast3D
var weapon : Node3D
var inAnimation : bool
var playerStateMachine : StateMachine
var timer : SceneTreeTimer
var bomb_collision : Area3D
var sword_model : Node3D
var bodies 
var anim_player : AnimationPlayer

func _ready():
	#timer.wait_time = 1
	bomb_collision = $Area3D
	anim_player = $AnimationPlayer
	timer = get_tree().create_timer(0.0)
	var player = get_tree().get_nodes_in_group("player")[0]
	collision = player.get_node("WeaponCollision")
	weapon = player.get_node("Weapon")
	playerStateMachine = player.get_node("StateMachine")
	sword_model = player.get_node("Weapon/swordidk")

	
func explode():
	var damage = 20 + bodies.size() * 5
	for body in bodies:
		body.apply_damage(damage)

func execute():
	if timer.time_left != 0:
		playerStateMachine.transition_to("Run")
		return
	timer = get_tree().create_timer(1)
	if inAnimation:
		return
	inAnimation = true
	bodies = bomb_collision.get_overlapping_bodies()
	global_position = sword_model.global_position
	anim_player.play("explode")
	collision.get_collisions()
	tween1(weapon)

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
