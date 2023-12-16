extends BombState

var target_position : Vector3

func enter(msg := {}) -> void:
	target_position = player.global_position
	$"../../AnimationPlayer".play("idle")
	
	
	
func physics_update(delta: float) -> void:
	var start_position = bomb.global_position
	var vector_to_target = (target_position - start_position).normalized() * 0.2
	bomb.global_translate(vector_to_target)
	if bomb.global_position.distance_to(target_position) < 1:
		state_machine.transition_to("WindUp")
