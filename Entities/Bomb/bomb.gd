extends Node3D

var target : Vector3

func set_enemy_area_monitoring(boolean : bool):
	$EnemyColl.monitoring = boolean
	
func set_player_area_monitoring(boolean : bool):
	$PlayerColl.monitoring = boolean
