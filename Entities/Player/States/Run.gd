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

@onready var animation_sprite = $"../../AnimatedSprite3D"
@onready var weapon = $"../../Weapon"

func physics_update(_delta: float) -> void:
	action_check()
	var movement_dir = Input.get_vector("move_forward", "move_backward", "move_right", "move_left")
	var direction = Vector3(movement_dir.x, 0, movement_dir.y).normalized()
	direction = direction.rotated(Vector3.UP, -PI/4)
	
	if movement_dir == Vector2.ZERO:
		animation_sprite.stop()
		state_machine.transition_to("Idle")
	else:
		var angle = movement_dir.angle()
		var snapped_angle = snapped(angle, PI / 4)
		var index = snapped_angle / (PI / 4)
		var animation = dict_anim.get(str(index))
		animation_sprite.play(animation)
		weapon.rotation.y = -snapped_angle + PI
		
	if direction:
		player.velocity = direction * player.speed
	else:
		player.velocity = Vector3.ZERO
	player.move_and_slide()

func action_check():
	if Input.is_action_just_pressed("ability_1"):
		state_machine.transition_to("ExecuteAbility", {"index" : 0})
	elif Input.is_action_just_pressed("ability_2"):
		state_machine.transition_to("ExecuteAbility", {"index" : 1})
	elif Input.is_action_just_pressed("ability_3"):
		state_machine.transition_to("ExecuteAbility", {"index" : 2})
