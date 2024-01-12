extends BombState

func enter(msg := {}) -> void:
	$"../../AnimationPlayer".play("in_air")
	
	
func physics_update(delta: float) -> void:
	var start_position = bomb.global_position
	var vector_to_target = (bomb.target - start_position).normalized() * 0.2
	vector_to_target.y = 0
	bomb.global_translate(vector_to_target)
	if bomb.global_position.distance_to(bomb.target) < 1:
		state_machine.transition_to("WindUp")
