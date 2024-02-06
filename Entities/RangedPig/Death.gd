extends Enemy

func dequeue():
	enemy.queue_free()

func enter(_msg := {}):
	$"../../AnimationTree".set("parameters/death_oneshot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
