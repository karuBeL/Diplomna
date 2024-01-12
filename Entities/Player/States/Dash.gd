extends PlayerState

@onready var dash_timer : Timer = $"../../Timer"
var target_position
var direction
var regular_speed

func dash_end():
	player.velocity = Vector3.ZERO
	player.speed = regular_speed
	state_machine.transition_to("Run")
	

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
	target_position = raycast_result['position']
	
func enter(msg := {}) -> void:
	regular_speed = player.speed
	player.speed = 100
	get_mouse_position()
	if !dash_timer.timeout.is_connected(dash_end):
		dash_timer.timeout.connect(dash_end)
	dash_timer.start()
	
func physics_update(_delta: float) -> void:
	var direction_to_target = player.global_position.direction_to(target_position).normalized()
	direction = (player.transform.basis * Vector3(direction_to_target.x, 0, direction_to_target.z)).normalized()
	player.global_translate(direction)
	if player.global_position.distance_to(target_position) < 1:
		dash_end()
