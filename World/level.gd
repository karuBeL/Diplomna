extends Node3D

var room_nodes : Array = []
var starting_room : RoomClass
var room_scene : PackedScene
var room_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	room_scene = load("res://Room/room.tscn")
	starting_room = room_scene.instantiate() as RoomClass
	starting_room.set_room()
	starting_room.set_initial_spawn()
	room_nodes.append(starting_room)
	var new_room
	var entrance_index
	for i in range(4):
		new_room = room_scene.instantiate() as RoomClass
		new_room.set_room()
		new_room.set_easy()
		entrance_index = randi_range(0, 3)
		new_room.set_entrance_door(entrance_index)
		room_nodes.append(new_room)
		
	for i in range(4):
		new_room = room_scene.instantiate() as RoomClass
		new_room.set_room()
		new_room.set_medium()
		entrance_index = randi_range(0, 3)
		new_room.set_entrance_door(entrance_index)
		room_nodes.append(new_room)
	
	new_room = room_scene.instantiate() as RoomClass
	new_room.set_room()
	new_room.set_hard()
	entrance_index = randi_range(0, 3)
	new_room.set_entrance_door(entrance_index)
	room_nodes.append(new_room)
	
	var exit_index
	var curr_index = 0
	while(curr_index + 1 != room_nodes.size()):
		var curr_room = room_nodes[curr_index] as RoomClass
		var next_room = room_nodes[curr_index + 1] as RoomClass
		exit_index = randi_range(0, 2)
		curr_room.set_exit_door(exit_index)
		curr_room.pair_room = next_room
		curr_index += 1
	
	add_child(room_nodes[room_index])
	room_index += 1
	
func switch_room():
	room_nodes[room_index - 1].queue_free()
	add_child(room_nodes[room_index])
	room_index += 1
