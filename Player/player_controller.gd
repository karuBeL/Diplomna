extends Entity

const dict_anim = {
	"0" : "testTowardsCamera",
	"1" : "testBottomLeft",
	"2" : "testLeftCamera",
	"3" : "testTopLeft",
	"4" : "testAwayCamera",
	"-3" : "testTopRight",
	"-2" : "testRightCamera",
	"-1" : "testBottomRight"
}

var slash = load_ability("slash")

func die():
	#print("big die")
	pass

func _ready():
	pass
	#set("speed", 13)
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("ability_1"):
		slash.execute($Weapon)
	
	var input_dir = Input.get_vector("move_forwards", "move_backwards", "move_right", "move_left")
	
	if input_dir == Vector2.ZERO:
		$AnimatedSprite3D.stop()
	else:
		var angle = input_dir.angle()
		var snapped_angle = snapped(angle, PI / 4)
		var index = snapped_angle / (PI / 4)
		$AnimatedSprite3D.play(dict_anim.get(str(index)))
		$Weapon.rotation.y = -snapped_angle + PI
		
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
