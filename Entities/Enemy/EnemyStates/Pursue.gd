extends Enemy


func enter(msg := {}) -> void:
	pass

func physics_update(delta: float) -> void:
	var target_position = (player.position - enemy.position).normalized()
	if enemy.position.distance_to(player.position) > 2:
		$"../../AnimationTree".set("parameters/Idle_Pursue/blend_amount", 1)
		enemy.velocity.x = target_position.x * enemy.speed
		enemy.velocity.z = target_position.z * enemy.speed
	else:
		enemy.velocity.x = move_toward(enemy.velocity.x, 0, enemy.speed)
		enemy.velocity.z = move_toward(enemy.velocity.z, 0, enemy.speed)
		$"../../AnimationTree".set("parameters/Idle_Pursue/blend_amount", 0)
	enemy.move_and_slide()
