extends Enemy

@onready var attack_timer : Timer = $"../../AttackTimer"
@onready var after_timer : Timer = $"../../AfterAttackTimer"
@onready var attack_collision : ShapeCast3D = $"../../AttackCast"
@onready var anim_tree : AnimationTree = $"../../AnimationTree" as AnimationTree

var count
var collided_object : EntityClass 

func hitPlayer():
	attack_collision.force_shapecast_update()
	count = attack_collision.get_collision_count()
	for i in count:
		collided_object = attack_collision.get_collider(i) as EntityClass
		if collided_object == player:
			collided_object.apply_damage(15)

func startAfterTimer():
	after_timer.start(0.2)


func enter(_msg := {}):
	if !after_timer.is_connected("timeout", transition):
		after_timer.timeout.connect(transition)
	if !attack_timer.is_stopped():
		state_machine.transition_to("Pursue")
		return
	attack_timer.start(1.5)
	after_timer.paused = false
	anim_tree.set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
func transition():
	state_machine.transition_to("Pursue")
