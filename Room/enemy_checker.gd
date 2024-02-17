extends Area3D

var room : RoomClass

func _ready():
	room = $"../../.." as RoomClass
	body_exited.connect(check_room_status)
	check_room_status(1)

func check_room_status(_body):
	if get_overlapping_bodies().size() - 1 <= 0:
		room.set_clear()

