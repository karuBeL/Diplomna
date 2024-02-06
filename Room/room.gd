extends Node3D

var spawn_player : Marker3D
var spawn_camera : Marker3D
var spawn1 : Marker3D
var spawn2 : Marker3D
var spawn3 : Marker3D
var spawn4 : Marker3D

func _ready():
	spawn_player = $NavigationRegion3D/Dungeon/PlayerSpawn
	spawn1 = $NavigationRegion3D/Dungeon/Spawn1
	spawn2 = $NavigationRegion3D/Dungeon/Spawn2
	spawn3 = $NavigationRegion3D/Dungeon/Spawn3
	spawn4 = $NavigationRegion3D/Dungeon/Spawn4
	enter_room()

func enter_room():
	print("entered room")
	spawn_player.spawn_entity()
	spawn1.spawn_entity()
	spawn2.spawn_entity()
	spawn3.spawn_entity()
	spawn4.spawn_entity()
