extends Enemy


func enter(msg := {}) -> void:
	pass

func physics_update(delta: float) -> void:
	var target_position = (player.position - enemy.position).normalized()
	if enemy.position.distance_to(player.position) > 2:
		$"../../AnimationPlayer".play("pursue")
		enemy.velocity.x = target_position.x * enemy.speed
		enemy.velocity.z = target_position.z * enemy.speed
	else:
		enemy.velocity.x = move_toward(enemy.velocity.x, 0, enemy.speed)
		enemy.velocity.z = move_toward(enemy.velocity.z, 0, enemy.speed)
		$"../../AnimationPlayer".play("idle")
	enemy.move_and_slide()
