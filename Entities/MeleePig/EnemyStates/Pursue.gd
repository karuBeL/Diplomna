extends Enemy

@onready var nav_set_timer : Timer = $"../../Timer"


func set_safe_velocity(safe_velocity):
	enemy.velocity = safe_velocity
	enemy.move_and_slide()
	

func nav_timer():
	if enemy.global_position.distance_to(player.global_position) > 2.5:
		enemy.nav_agent.target_position = player.global_position
	nav_set_timer.wait_time = 0.25 + randf_range(0.25, 0.5)
	nav_set_timer.start()
	
	
func enter(msg := {}) -> void:
	enemy.nav_agent.target_position = player.global_position
	if !(nav_set_timer.timeout.is_connected(nav_timer) && 
	enemy.nav_agent.velocity_computed.is_connected(set_safe_velocity)):
		nav_set_timer.timeout.connect(nav_timer)
		enemy.nav_agent.velocity_computed.connect(set_safe_velocity)
	nav_set_timer.start()

func exit():
	nav_set_timer.stop()

func physics_update(delta: float) -> void:
	var target_position : Vector3 = (player.global_position - enemy.global_position).normalized()
	var distance_to_player = enemy.global_position.distance_to(player.global_position)
	var next_position = enemy.nav_agent.get_next_path_position()
	
	if distance_to_player > 2 || enemy.speed == 0:
		$"../../AnimationTree".set("parameters/idle_pursue_stunned/blend_amount", 1)
		enemy.nav_agent.velocity = (next_position - enemy.global_position).normalized() * enemy.speed
		enemy.nav_agent.velocity.y = 0
	else:
		enemy.velocity = Vector3.ZERO
		state_machine.transition_to("Idle", {"attack" : true})
	
	
	if target_position.x > -0.7 && target_position.z < 0.7:
		$"../../Sprite3D".set("flip_h", true)
	else:
		$"../../Sprite3D".set("flip_h", false)
		
	if distance_to_player <= 3:
		enemy.nav_agent.avoidance_enabled = false
		enemy.velocity = target_position * enemy.speed
		enemy.move_and_slide()
	elif distance_to_player > 3:
		enemy.nav_agent.avoidance_enabled = true
	
	
		
