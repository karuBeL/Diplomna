extends Enemy

@onready var hit_timer : SceneTreeTimer = get_tree().create_timer(0.0)
var count
var collided_object : Entity 

func hitPlayer():
	var bomb : Node3D = load("res://Entities/RangedPig/Bomb/bomb.tscn").instantiate()
	add_child(bomb)
	bomb.global_position = enemy.global_position + Vector3(0, 1, 0)
	
	
func enter(msg := {}):
	if hit_timer.time_left != 0:
		state_machine.transition_to("Pursue")
		return
	hit_timer = get_tree().create_timer(2.0)
	enemy.velocity = Vector3.ZERO
	$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func physics_update(delta: float) -> void:
	if player.position.z < 0:
		$"../../Sprite3D".set("flip_h", true)
	else:
		$"../../Sprite3D".set("flip_h", false)
	
	if enemy.global_position.distance_to(player.global_position) > 10:
		state_machine.transition_to("Pursue")
	elif hit_timer.time_left == 0:
		hit_timer = get_tree().create_timer(2.0)
		$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
