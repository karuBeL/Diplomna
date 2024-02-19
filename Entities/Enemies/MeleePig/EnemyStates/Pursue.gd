extends EnemyState

@onready var nav_set_timer : Timer = $"../../NavTimer" as Timer
@onready var anim_tree : AnimationTree = $"../../AnimationTree" as AnimationTree
@onready var sprite : Sprite3D = $"../../Sprite3D" as Sprite3D

func set_safe_velocity(safe_velocity):
	enemy.velocity = safe_velocity
	enemy.move_and_slide()
	
func nav_timer():
	enemy.nav_agent.target_position = player.global_position
	nav_set_timer.wait_time = 0.1 + randf_range(0.1, 0.3)
	nav_set_timer.start()
	
func enter(_msg := {}) -> void:
	enemy.nav_agent.target_position = player.global_position
	if !(nav_set_timer.timeout.is_connected(nav_timer) && 
	enemy.nav_agent.velocity_computed.is_connected(set_safe_velocity)):
		nav_set_timer.timeout.connect(nav_timer)
		enemy.nav_agent.velocity_computed.connect(set_safe_velocity)
	nav_set_timer.start()

func exit():
	nav_set_timer.stop()

func physics_update(_delta: float) -> void:
	var target_position : Vector3 = (player.global_position - enemy.global_position).normalized()
	var distance_to_player = enemy.global_position.distance_to(player.global_position)
	var next_position = enemy.nav_agent.get_next_path_position()
	
	if distance_to_player > enemy.attack_distance:
		enemy.nav_agent.avoidance_enabled = true
		anim_tree.set("parameters/idle_pursue_stunned/blend_amount", 1)
		enemy.nav_agent.velocity = (next_position - enemy.global_position).normalized() * enemy.speed
		enemy.nav_agent.velocity.y = 0
	else:
		enemy.nav_agent.avoidance_enabled = false
		anim_tree.set("parameters/idle_pursue_stunned/blend_amount", 0)
		state_machine.transition_to("Attack")
	
	if target_position.x > -0.7 && target_position.z < 0.7:
		sprite.set("flip_h", true)
	else:
		sprite.set("flip_h", false)
	
