extends Node3D
class_name RoomClass

var initial_spawn : SpawnClass
var spawns : Array
var doors : Array
var set_spawns : Array
var exit_door : DoorClass
var entrance_door : DoorClass
var pair_room : RoomClass
var collision : Area3D


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
	doors = [door1, door2, door3, door4]
	spawns = [spawn1, spawn2, spawn3, spawn4, spawn5, spawn6, spawn7, spawn8]
	set_spawns = []
	door1.set_door()
	door2.set_door()
	door3.set_door()
	door4.set_door()

func enter_room():
	if initial_spawn != null:
		initial_spawn.spawn_entity()
		$".".set_clear()
		return
	entrance_door.player_spawn.spawn_entity()
	for s in set_spawns:
		s.spawn_entity()

func set_initial_spawn():
	initial_spawn = $NavigationRegion3D/Dungeon/PlayerSpawn as SpawnClass
	initial_spawn.is_player = true

func set_entrance_door(door_number):
	entrance_door = doors.pop_at(door_number) as DoorClass
	entrance_door.set_player_spawn()

func set_exit_door(door_number):
	exit_door = doors[door_number] as DoorClass
	exit_door.area.body_entered.connect(transition)

func transition(_body):
	get_parent().switch_room()

func set_clear():
	exit_door.set_open()

func set_enemy_spawn(enemy_scene):
	var index = randi_range(0, spawns.size() - 1)
	var random_spawn = spawns[index]
	
	set_spawns.append(spawns.pop_at(index))
	random_spawn.entity = enemy_scene

	return random_spawn

func set_easy():
	for i in range(2):
		set_enemy_spawn(load("res://Entities/MeleePig/melee_pig.tscn"))
	for i in range(1):
		set_enemy_spawn(load("res://Entities/RangedPig/ranged_pig.tscn"))
		
	
func set_medium():
	for i in range(3):
		set_enemy_spawn(load("res://Entities/MeleePig/melee_pig.tscn"))
	for i in range(2):
		set_enemy_spawn(load("res://Entities/RangedPig/ranged_pig.tscn"))
		
func set_hard():
	for i in range(5):
		set_enemy_spawn(load("res://Entities/MeleePig/melee_pig.tscn"))
	for i in range(3):
		set_enemy_spawn(load("res://Entities/RangedPig/ranged_pig.tscn"))
		
