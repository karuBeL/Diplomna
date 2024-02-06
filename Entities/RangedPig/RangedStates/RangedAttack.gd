extends Enemy

@onready var hit_timer : SceneTreeTimer = get_tree().create_timer(0.0)
var count
var collided_object : EntityClass 


func hitPlayer():
	var bomb : Node3D = load("res://Entities/RangedPig/Bomb/bomb.tscn").instantiate()
	bomb.target = player.global_position
	bomb.set_player_area_monitoring(true)
	add_child(bomb)
	bomb.global_position = enemy.global_position
	
	
	
func enter(_msg := {}):
	if hit_timer.time_left != 0:
		state_machine.transition_to("Pursue")
		return
	hit_timer = get_tree().create_timer(2.0)
	enemy.velocity = Vector3.ZERO
	$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func physics_update(_delta: float) -> void:
	var target_position : Vector3 = (player.global_position - enemy.global_position).normalized()
	if target_position.x > -0.7 && target_position.z < 0.7:
		$"../../Sprite3D".set("flip_h", true)
	else:
		$"../../Sprite3D".set("flip_h", false)
	
	if enemy.global_position.distance_to(player.global_position) > 10:
		state_machine.transition_to("Pursue")
	elif hit_timer.time_left == 0:
		hit_timer = get_tree().create_timer(2.0)
		$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
