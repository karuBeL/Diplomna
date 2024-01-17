extends Node

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var playerStateMachine : StateMachine = player.get_node("StateMachine")
var bomb : Node3D

	
func get_mouse_position():
	var camera = get_tree().root.get_camera_3d()
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 100
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var space = camera.get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.collision_mask = 16
	ray_query.from = from
	ray_query.to = to
	ray_query.collide_with_areas = true
	var raycast_result = space.intersect_ray(ray_query)
	print(raycast_result)
	return raycast_result['position']

func execute():
	bomb = load("res://Entities/RangedPig/Bomb/bomb.tscn").instantiate()
	bomb.set_enemy_area_monitoring(true)
	bomb.target = get_mouse_position()
	add_child(bomb)
	bomb.global_position = player.global_position
	playerStateMachine.transition_to("Run")
	
