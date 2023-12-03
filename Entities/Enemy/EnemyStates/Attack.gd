extends Enemy

@onready var hit_timer : SceneTreeTimer = get_tree().create_timer(0.0)
@onready var attack_collision : ShapeCast3D = $"../../AttackCast"
var count
var collided_object : Entity 

func hitPlayer():
	attack_collision.force_shapecast_update()
	if !attack_collision.is_colliding():
		state_machine.transition_to("Pursue")
		return
	count = attack_collision.get_collision_count()
	for i in count:
		collided_object = attack_collision.get_collider(i) as Entity
		if collided_object == player:
			collided_object.apply_damage(10)
	state_machine.transition_to("Pursue")


func enter(msg := {}):
	if hit_timer.time_left != 0:
		state_machine.transition_to("Pursue")
		return
	hit_timer = get_tree().create_timer(2.0)
	$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	#state_machine.transition_to("Pursue")
	#attack_collision.

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
