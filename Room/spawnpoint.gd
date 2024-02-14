extends Marker3D
class_name SpawnClass

var entity : PackedScene
var player : EntityClass

func _ready():
	player = get_tree().get_first_node_in_group("player")

func spawn_enemy():
	if entity == null:
		return
	var spawned_entity : EntityClass = entity.instantiate() as EntityClass
	add_child(spawned_entity)
	spawned_entity.global_position = global_position

func teleport_player():
	player.global_position = global_position
