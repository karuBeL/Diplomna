extends Player

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

func enter(_msg := {}) -> void:
#	player.velocity = Vector3.ZERO
	pass
	
	
func physics_update(_delta: float) -> void:
	var movement_dir = Input.get_vector("move_forwards", "move_backwards", "move_right", "move_left")
	var direction = (player.transform.basis * Vector3(movement_dir.x, 0, movement_dir.y)).normalized()
	
	if movement_dir == Vector2.ZERO:
		$"../../AnimatedSprite3D".stop()
		state_machine.transition_to("Idle")
	else:
		var angle = movement_dir.angle()
		var snapped_angle = snapped(angle, PI / 4)
		var index = snapped_angle / (PI / 4)
		$"../../AnimatedSprite3D".play(dict_anim.get(str(index)))
		$"../../Weapon".rotation.y = -snapped_angle + PI
	
	if direction:
		player.velocity.x = direction.x * player.speed
		player.velocity.z = direction.z * player.speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
		player.velocity.z = move_toward(player.velocity.z, 0, player.speed)
	
	player.move_and_slide()
