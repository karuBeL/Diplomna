extends PlayerState

const dict_anim = {
	"0" : "backward",
	"1" : "bottom_left",
	"2" : "left",
	"3" : "top_left",
	"4" : "forward",
	"-3" : "top_right",
	"-2" : "right",
	"-1" : "bottom_right"
}

var anim

func enter(_msg := {}) -> void:
#	player.velocity = Vector3.ZERO
	pass
	
	
func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("ability_1"):
		state_machine.transition_to("executeAbility", {"index" : 0})
	elif Input.is_action_just_pressed("ability_2"):
		state_machine.transition_to("executeAbility", {"index" : 1})
	elif Input.is_action_just_pressed("ability_3"):
		state_machine.transition_to("executeAbility", {"index" : 2})
		
	var movement_dir = Input.get_vector("move_forward", "move_backward", "move_right", "move_left")
	var direction = (player.transform.basis * Vector3(movement_dir.x, 0, movement_dir.y)).normalized()
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
		player.velocity = direction * player.speed
	else:
		player.velocity = Vector3.ZERO
	
	player.move_and_slide()
