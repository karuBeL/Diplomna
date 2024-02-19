extends EnemyClass


func _ready():
	attack_distance = 10
	player = get_tree().get_first_node_in_group("player")
	nav_agent = get_node("NavigationAgent3D")
	state_machine = get_node("StateMachine")
	
func hit_player():
	var bomb : Node3D = load("res://Entities/Bomb/bomb.tscn").instantiate()
	bomb.target = player.global_position
	bomb.set_player_area_monitoring(true)
	add_child(bomb)
	bomb.global_position = global_position
