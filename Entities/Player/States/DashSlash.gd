extends PlayerState

@onready var dash_timer : Timer = $"../../DashTimer"
@onready var collision : Area3D = $"../../DashSlashCollision"

var speed_value = 40
var already_attacked : Dictionary
var target_position
var direction
var regular_speed
var direction_to_target

func dash_end():
	player.velocity = Vector3.ZERO
	player.speed = regular_speed
	collision.monitoring = false
	target_position = null	
	already_attacked.clear()
	state_machine.transition_to("Run")
	
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
	regular_speed = player.speed
	player.speed = 100
	direction_to_target = player.global_position.direction_to(target_position).normalized()
	if !dash_timer.timeout.is_connected(dash_end):
		dash_timer.timeout.connect(dash_end)
		collision.body_entered.connect(slash_enemies)
	collision.monitoring = true
	dash_timer.start()

func slash_enemies(body : EntityClass):
	if !already_attacked.has(body):
		body.apply_damage(100)
		already_attacked[body] = null
		
func physics_update(_delta: float) -> void:
	player.velocity.x = direction_to_target.x * speed_value
	player.velocity.z = direction_to_target.z * speed_value
	player.move_and_slide()
