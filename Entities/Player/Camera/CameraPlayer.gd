extends CharacterBody3D

@onready var player = $".." as EntityClass

const Kp = 5 #proportional gain
func _physics_process(_delta):
	var distance = global_position.distance_to(Vector3(player.global_position.x, 0, player.global_position.z))
	
	var error_vector = Vector3(player.global_position.x - global_position.x, 0.0, player.global_position.z - global_position.z)
	if (abs(error_vector.x) < 0.1):
		error_vector.x = 0
	if (abs(error_vector.z) < 0.1):
		error_vector.z = 0
	var control_output = Kp * distance
	var control_velocity = control_output * error_vector 
	velocity = control_velocity + player.velocity
	print(distance)
	move_and_slide()
