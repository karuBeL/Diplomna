extends CharacterBody3D


const SPEED = 13.0

func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
	var input_dir = Input.get_vector("move_forwards", "move_backwards", "move_right", "move_left")
#	if Input.is_action_just_pressed("move_forwards"):
#		$AnimatedSprite3D.play("testAwayCamera")
#	if Input.is_action_just_pressed("move_backwards"):
#		$AnimatedSprite3D.play("testTorwardsCamera")
#	if Input.is_action_just_pressed("move_right"):
#		$AnimatedSprite3D.play("testRightCamera")
#	if Input.is_action_just_pressed("move_left"):
#		$AnimatedSprite3D.play("testLeftCamera")
#
#	if Input.is_action_just_pressed("move_backwards") && Input.is_action_just_pressed("move_left"):
#		$AnimatedSprite3D.play("testBottomLeft")
#	if Input.is_action_just_pressed("move_backwards") && Input.is_action_just_pressed("move_right"):
#		$AnimatedSprite3D.play("testBottomRight")
#	if Input.is_action_just_pressed("move_forwards") && Input.is_action_just_pressed("move_left"):
#		$AnimatedSprite3D.play("testTopLeft")
#	if Input.is_action_just_pressed("move_forwards") && Input.is_action_just_pressed("move_right"):
#		$AnimatedSprite3D.play("testTopRight")
	
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	print("x:")
	print(direction.x)
	print("z:")
	print(direction.z)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
