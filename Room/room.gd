extends Node3D
class_name RoomClass

var initial_player_spawn
var spawns : Array
var door_pairs : Dictionary
var exit_doors : Dictionary
var set_spawns : Array
var exit_door : DoorClass
var entrance_door : DoorClass
var pair_room : RoomClass
var collision : Area3D
var melee_hard_diff = 5
var melee_medium_diff = 3
var melee_easy_diff = 2
var ranged_hard_diff = 3
var ranged_medium_diff = 2
var ranged_easy_diff = 1


func _ready():
	enter_room()

func set_room():
	var spawn1 = $NavigationRegion3D/Dungeon/Spawn1
	var spawn2 = $NavigationRegion3D/Dungeon/Spawn2
	var spawn3 = $NavigationRegion3D/Dungeon/Spawn3
	var spawn4 = $NavigationRegion3D/Dungeon/Spawn4
	var spawn5 = $NavigationRegion3D/Dungeon/Spawn5
	var spawn6 = $NavigationRegion3D/Dungeon/Spawn6
	var spawn7 = $NavigationRegion3D/Dungeon/Spawn7
	var spawn8 = $NavigationRegion3D/Dungeon/Spawn8
	var door1 = $NavigationRegion3D/Dungeon/Door1
	var door2 = $NavigationRegion3D/Dungeon/Door2
	var door3 = $NavigationRegion3D/Dungeon/Door3
	var door4 = $NavigationRegion3D/Dungeon/Door4
	door_pairs = {"door1" : door2, "door2" : door1, "door3" : door4, "door4" : door3}
	exit_doors = {"door1" : door1, "door2" : door2, "door3" : door3, "door4" : door4}
	spawns = [spawn1, spawn2, spawn3, spawn4, spawn5, spawn6, spawn7, spawn8]
	set_spawns = []
	door1.set_door()
	door2.set_door()
	door3.set_door()
	door4.set_door()

func enter_room():
	if initial_player_spawn != null:
		initial_player_spawn.teleport_player()
		set_clear()
		return
	entrance_door.spawn_player()
	for s in set_spawns:
		s.spawn_enemy()

func set_initial_player_spawn():
	initial_player_spawn = $NavigationRegion3D/Dungeon/PlayerSpawn as SpawnClass

func set_entrance_door(exit_door_key):
	entrance_door = door_pairs.get(exit_door_key) as Node3D
	exit_doors.erase(entrance_door.name.to_lower())

func set_exit_door(door_index):
	exit_door = exit_doors.values()[door_index]
	exit_door.area.body_entered.connect(transition)
	return exit_doors.find_key(exit_door)

func transition(_body):
	get_parent().switch_room()

func set_clear():
	exit_door.set_open()

func set_enemy_spawn(enemy_scene : PackedScene):
	var index = randi_range(0, spawns.size() - 1)
	var random_spawn = spawns[index]
	set_spawns.append(spawns.pop_at(index))
	random_spawn.entity = enemy_scene
	return random_spawn

func set_easy():
	for i in range(melee_easy_diff):
		set_enemy_spawn(load("res://Entities/Enemies/MeleePig/melee_pig.tscn"))
	for i in range(ranged_easy_diff):
		set_enemy_spawn(load("res://Entities/Enemies/RangedPig/ranged_pig.tscn"))
		
func set_medium():
	for i in range(melee_medium_diff):
		set_enemy_spawn(load("res://Entities/Enemies/MeleePig/melee_pig.tscn"))
	for i in range(ranged_medium_diff):
		set_enemy_spawn(load("res://Entities/Enemies/RangedPig/ranged_pig.tscn"))
		
func set_hard():
	for i in range(melee_hard_diff):
		set_enemy_spawn(load("res://Entities/Enemies/MeleePig/melee_pig.tscn"))
	for i in range(ranged_hard_diff):
		set_enemy_spawn(load("res://Entities/Enemies/RangedPig/ranged_pig.tscn"))
		
