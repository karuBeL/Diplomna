extends Node3D
class_name DoorClass

var closed_door : Node3D
var open_door : Node3D
var player_spawn : SpawnClass
var area : Area3D

func set_door():
	closed_door = $door as Node3D
	open_door = $opendoor as Node3D
	player_spawn = $PlayerSpawn as Marker3D
	area = $Area3D
	set_closed()

func set_open():
	closed_door.visible = false
	open_door.visible = true
	area.monitoring = true

func set_closed():
	closed_door.visible = true
	open_door.visible = false
	area.monitoring = false

func set_player_spawn():
	player_spawn.is_player = true

func spawn_player():
	player_spawn.spawn_entity()
