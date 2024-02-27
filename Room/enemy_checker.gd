extends Area3D

var room : RoomClass

func _ready():
	room = $"../../.." as RoomClass
	body_exited.connect(check_room_status)

func check_room_status(_body):
	if get_overlapping_bodies().size() - 1 <= 0:
		room.exit_door.set_open()

