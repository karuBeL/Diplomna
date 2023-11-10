extends CharacterBody3D


const SPEED = 13.0

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

func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	
	var input_dir = Input.get_vector("move_forwards", "move_backwards", "move_right", "move_left")
	if input_dir == Vector2.ZERO:
		$AnimatedSprite3D.stop()
	else:
		var angle = input_dir.angle()
		var snapped_angle = snapped(angle, PI / 4)
		var index = snapped_angle / (PI / 4)
		$AnimatedSprite3D.play(dict_anim.get(str(index)))
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	#var anim_string = dict_animations.get(str(Vector2(1, 0)))
	#$AnimatedSprite3D.play(anim_string)
	#print("x:")
	#print(direction.x)
	#print("z:")
	#print(direction.z)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
