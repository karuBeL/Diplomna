extends Marker3D
class_name SpawnClass

@export var entity : PackedScene
var is_player : bool = false
var player

func _ready():
	player = get_tree().get_first_node_in_group("player")

func spawn_entity():
	if is_player:
		player.global_position = global_position
		return
	if entity == null:
		return
	var spawned_entity : EntityClass = entity.instantiate() as EntityClass
	
	add_child(spawned_entity)
	spawned_entity.global_position = global_position
