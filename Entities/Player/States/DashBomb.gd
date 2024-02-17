extends PlayerState

@onready var dash_timer : Timer = $"../../DashTimer"
var target_position
var speed_value = 35
var from_position = Vector3.ZERO
var to_position = Vector3.ZERO
var distance_traveled : float = 0.0
var direction_to_target
var limit = 0

func dash_end():
	player.velocity = Vector3.ZERO
	state_machine.transition_to("Run")
	target_position = null
	limit = 0
	distance_traveled = 0

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
	
func enter(_msg := {}) -> void:
	get_mouse_position()
	if target_position == null:
		state_machine.transition_to("Run")
		return
	direction_to_target = player.global_position.direction_to(target_position).normalized()
	if !dash_timer.timeout.is_connected(dash_end):
		dash_timer.timeout.connect(dash_end)
	dash_timer.start()
	
func spawn_bomb(position):
	var bomb = load("res://Entities/RangedPig/Bomb/bomb.tscn").instantiate()
	bomb.set_enemy_area_monitoring(true)
	bomb.target = position
	add_child(bomb)
	bomb.global_position = position
	distance_traveled = 0
	limit += 1
	
func physics_update(_delta: float) -> void:
	
	from_position = player.global_position
	player.velocity.x = direction_to_target.x * speed_value
	player.velocity.z = direction_to_target.z * speed_value
	player.move_and_slide()
	to_position = player.global_position
	distance_traveled += from_position.distance_to(to_position)

	if distance_traveled > 1.7 && limit != 2:
		spawn_bomb(to_position)
