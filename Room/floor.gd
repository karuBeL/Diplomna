extends Area3D

var enemy_count

func _ready():
	body_exited.connect(check_room_status)

	
func check_room_status(_body):
	enemy_count = get_overlapping_bodies().size()
	if enemy_count <= 0:
		$"../../..".set_clear()
