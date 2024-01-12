extends PlayerState


func enter(msg := {}) -> void:
	$"../../AnimatedSprite3D".play("death")
	$"../../Weapon".visible = false
