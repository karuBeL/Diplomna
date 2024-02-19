extends Node

var player
var playerStateMachine : StateMachine
var timer : Timer
var bomb : Node3D
var target_position : Vector3


func _ready():
	timer = $Timer as Timer
	player = get_tree().get_nodes_in_group("player")[0]
	playerStateMachine = player.get_node("StateMachine")
	

func get_mouse_position():
	var camera = get_tree().root.get_camera_3d()
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 50
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var space = camera.get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.collision_mask = 16
	ray_query.from = from
	ray_query.to = to
	ray_query.collide_with_areas = true
	var raycast_result = space.intersect_ray(ray_query)
	if !raycast_result['position']:
		return
	target_position = raycast_result['position']
	target_position.y = 0
	

func execute():
	if !timer.is_stopped():
		playerStateMachine.transition_to("Run")
		return
	get_mouse_position()
	timer.start(4)
	bomb = load("res://Entities/Bomb/bomb.tscn").instantiate()
	bomb.set_enemy_area_monitoring(true)
	bomb.target = target_position
	add_child(bomb)
	bomb.global_position = player.global_position
	playerStateMachine.transition_to("Run")
	

