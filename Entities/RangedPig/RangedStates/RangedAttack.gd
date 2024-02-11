extends Enemy

@onready var attack_timer = $"../../AttackTimer" as Timer
@onready var after_timer = $"../../AfterAttackTimer" as Timer
var count
var collided_object : EntityClass 

func hitPlayer():
	var bomb : Node3D = load("res://Entities/RangedPig/Bomb/bomb.tscn").instantiate()
	bomb.target = player.global_position
	bomb.set_player_area_monitoring(true)
	add_child(bomb)
	bomb.global_position = enemy.global_position
	
func enter(_msg := {}):
	if !after_timer.is_connected("timeout", transition):
		after_timer.timeout.connect(transition)
	if !attack_timer.is_stopped():
		state_machine.transition_to("Pursue")
		return
	attack_timer.start(2)
	after_timer.start(0.5)
	enemy.velocity = Vector3.ZERO
	$"../../AnimationTree".set("parameters/attack_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
func transition():
	state_machine.transition_to("Pursue")
