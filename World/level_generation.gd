extends Node3D

var room_nodes : Array = []
var starting_room : RoomClass
var room_scene : PackedScene
var room_index = 0

func _ready():
	randomize()
	room_scene = load("res://Room/room.tscn")
	starting_room = room_scene.instantiate() as RoomClass
	starting_room.set_room()
	starting_room.set_initial_spawn()
	room_nodes.append(starting_room)
	
	var new_room
	for i in range(4): #Setting 4 easy difficulty rooms
		new_room = room_scene.instantiate() as RoomClass
		new_room.set_room()
		new_room.set_easy()
		room_nodes.append(new_room)
		
	for i in range(4): #Setting 4 medium difficulty rooms
		new_room = room_scene.instantiate() as RoomClass
		new_room.set_room()
		new_room.set_medium()
		room_nodes.append(new_room)
		
	#Setting 1 hard difficulty room
	new_room = room_scene.instantiate() as RoomClass
	new_room.set_room()
	new_room.set_hard()
	room_nodes.append(new_room)
	
	#TODO: Make a method to get random exit index
	var exit_index = randi_range(0, 3)
	var previous_door = room_nodes[0].set_exit_door(exit_index)
	
	room_nodes[0].pair_room = room_nodes[1]

	var curr_index = 1
	while(curr_index + 1 != room_nodes.size()):
		print(previous_door)
		var curr_room = room_nodes[curr_index] as RoomClass
		var next_room = room_nodes[curr_index + 1] as RoomClass
		curr_room.set_entrance_door(previous_door)
		exit_index = randi_range(0, 2)
		previous_door = curr_room.set_exit_door(exit_index)
		curr_room.pair_room = next_room
		curr_index += 1
	
	add_child(room_nodes[room_index])
	room_index += 1


func switch_room():
	room_nodes[room_index - 1].queue_free()
	add_child(room_nodes[room_index])
	room_index += 1
