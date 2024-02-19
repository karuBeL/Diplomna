extends EnemyState

func dequeue():
	enemy.queue_free()

func enter(_msg := {}):
	enemy.nav_agent.avoidance_enabled = false
	enemy.velocity = Vector3.ZERO
	enemy.move_and_slide()
	$"../../AnimationTree".set("parameters/death_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
