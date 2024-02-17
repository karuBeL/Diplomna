extends CharacterBody3D

@onready var player = $".." as EntityClass

const deadzone = 0.2
const max_speed_factor = 10
@onready var coll : CollisionShape3D = $CameraCollision as CollisionShape3D
func _physics_process(_delta):
	var vector_to_player : Vector3 = player.global_position - global_position
	var direction_to_player = vector_to_player.normalized()
	var distance_to_player = vector_to_player.length()
	var speed_factor = distance_to_player / deadzone
	
	if speed_factor > max_speed_factor:
		speed_factor = max_speed_factor
	
	if (distance_to_player < deadzone):
		velocity = Vector3.ZERO
	else:
		velocity = direction_to_player * (speed_factor ** 2)
	
	move_and_slide()

