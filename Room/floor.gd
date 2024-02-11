extends Area3D

var enemy_count

func _ready():
	body_exited.connect(check_room_status)
	check_room_status(1)

	
func check_room_status(_body):
	print("checked_room")
	enemy_count = get_overlapping_bodies().size() - 1
	print (enemy_count)
	if enemy_count <= 0:
		$"../../..".set_clear()
