extends CharacterBody3D

@onready var player = $"../Player"

const Kp = 5 #proportional gain

func _physics_process(delta):
	#To get a gradual camera movement towards the player, we use a proportional control algorithm (proportional-integral-derivative method)
	var distance = global_position.distance_to(Vector3(player.global_position.x, 0, player.global_position.z))
	velocity = player.get_real_velocity()	
	if distance != 0.0:	
		#The vector that points from the camera to the player
		var error_vector = Vector3(player.global_position.x - global_position.x, 0.0, player.global_position.z - global_position.z)
		if (abs(error_vector.x) < 0.01):
			error_vector.x = 0
			
		if (abs(error_vector.z) < 0.01):
			error_vector.z = 0
		
		var control_output = Kp * (distance) #Using the proportional gain, we can control the desired separation between the two
		var control_velocity = control_output * (error_vector / distance) #The vector that represents the velocity at which the camera needs to move to close the gap
		velocity += control_velocity
	move_and_slide()
