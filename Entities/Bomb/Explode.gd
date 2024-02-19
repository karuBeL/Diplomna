extends BombState

var aoe : Area3D


func free_bomb():
	bomb.queue_free()

func explode():
	var bodies = aoe.get_overlapping_bodies()
	for body in bodies:
		body.get_hit(20)
	
func enter(_msg := {}) -> void:
	if $"../../PlayerColl".monitoring:
		aoe = $"../../PlayerColl"
	else:
		aoe = $"../../EnemyColl"
	$"../../AnimationPlayer".play("explode")
