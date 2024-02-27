extends EnemyState

func dequeue():
	enemy.queue_free()

func enter(_msg := {}):
	enemy.speed = 0
	$"../../AnimationTree".set("parameters/death_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
