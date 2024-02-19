extends EnemyState

@onready var attack_timer : Timer = $"../../AttackTimer"
@onready var after_timer : Timer = $"../../AfterAttackTimer"
@onready var attack_collision : ShapeCast3D = $"../../AttackCast"
@onready var anim_tree : AnimationTree = $"../../AnimationTree" as AnimationTree

var count
var collided_object : PlayerClass 

func startAfterTimer():
	after_timer.start()

func enter(_msg := {}):
	if !after_timer.is_connected("timeout", transition):
		after_timer.timeout.connect(transition)
	if !attack_timer.is_stopped():
		state_machine.transition_to("Pursue")
		return
	attack_timer.start()
	after_timer.paused = false
	anim_tree.set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
func transition():
	state_machine.transition_to("Pursue")
