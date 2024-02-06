extends Enemy

@onready var hit_timer : SceneTreeTimer = get_tree().create_timer(0.0)
@onready var attack_collision : ShapeCast3D = $"../../AttackCast"
var count
var collided_object : EntityClass 

func hitPlayer():
	attack_collision.force_shapecast_update()
	count = attack_collision.get_collision_count()
	for i in count:
		collided_object = attack_collision.get_collider(i) as EntityClass
		if collided_object == player:
			collided_object.apply_damage(10)


func physics_update(_delta: float) -> void:
	var target_position : Vector3 = (player.global_position - enemy.global_position).normalized()
	if target_position.x > -0.7 && target_position.z < 0.7:
		$"../../Sprite3D".set("flip_h", true)
	else:
		$"../../Sprite3D".set("flip_h", false)
	
	if enemy.global_position.distance_to(player.global_position) > 2:
		state_machine.transition_to("Pursue")
	elif hit_timer.time_left == 0:
		hit_timer = get_tree().create_timer(2.0)
		$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
