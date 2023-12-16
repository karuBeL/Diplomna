extends BombState

@onready var aoe : Area3D =  $"../../Area3D"


func free_bomb():
	bomb.queue_free()

func explode():
	var bodies = aoe.get_overlapping_bodies()
	for body in bodies:
		if body == player:
			body.apply_damage(20)
	
func enter(msg := {}) -> void:
	#print("bruh")
	$"../../AnimationPlayer".play("explode")
