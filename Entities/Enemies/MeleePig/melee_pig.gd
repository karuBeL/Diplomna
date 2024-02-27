extends EnemyClass

var attack_collision : ShapeCast3D

func _ready():
	attack_distance = 2
	wait_time_gen = get_node("/root/WaitTime")
	attack_collision = $AttackCast
	player = get_tree().get_first_node_in_group("player")
	nav_agent = get_node("NavigationAgent3D")
	state_machine = get_node("StateMachine")

func hitPlayer():
	attack_collision.force_shapecast_update()
	var count = attack_collision.get_collision_count()
	for i in count:
		var collided_object = attack_collision.get_collider(i) as PlayerClass
		if collided_object == player:
			collided_object.get_hit(15)
