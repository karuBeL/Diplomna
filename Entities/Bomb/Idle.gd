extends BombState

var bomb_speed = 0.2

func enter(_msg := {}) -> void:
	$"../../AnimationPlayer".play("in_air")
	
	
func physics_update(_delta: float) -> void:
	var start_position = bomb.global_position
	var vector_to_target = (bomb.target - start_position).normalized()
	vector_to_target.y = 0
	bomb.global_translate(vector_to_target * bomb_speed)
	if bomb.global_position.distance_to(bomb.target) < 1:
		state_machine.transition_to("WindUp")

