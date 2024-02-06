extends PlayerState


func enter(_msg := {}) -> void:
	$"../../AnimatedSprite3D".play("death")
	$"../../Weapon".visible = false
