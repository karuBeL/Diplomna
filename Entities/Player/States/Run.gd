extends PlayerState

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

var anim

func enter(_msg := {}) -> void:
#	player.velocity = Vector3.ZERO
	pass
	
	
func physics_update(_delta: float) -> void:
	var movement_dir = Input.get_vector("move_forwards", "move_backwards", "move_right", "move_left")
	var direction = (player.transform.basis * Vector3(movement_dir.x, 0, movement_dir.y)).normalized()
	if Input.is_action_just_pressed("ability_1"):
		state_machine.transition_to("executeAbility", {"index" : 0})
	elif Input.is_action_just_pressed("ability_2"):
		state_machine.transition_to("executeAbility", {"index" : 1})
	direction = direction.rotated(Vector3.UP, -PI/4)
	if movement_dir == Vector2.ZERO:
		$"../../AnimatedSprite3D".stop()
		state_machine.transition_to("Idle", {"angle": anim})
	else:
		var angle = movement_dir.angle()
		var snapped_angle = snapped(angle, PI / 4)
		var index = snapped_angle / (PI / 4)
		anim = dict_anim.get(str(index))
		$"../../AnimatedSprite3D".play(anim)
		$"../../Weapon".rotation.y = -snapped_angle + PI
	
	if direction:
		player.velocity.x = direction.x * player.speed
		player.velocity.z = direction.z * player.speed
		#print(player.velocity.z)
		#print(player.velocity.x)
		
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
		player.velocity.z = move_toward(player.velocity.z , 0, player.speed)
	
	player.move_and_slide()
