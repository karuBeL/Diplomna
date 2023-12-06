extends State
class_name Enemy

var enemy: Entity
var player : Entity

func _ready() -> void:
	await owner.ready
	enemy = owner as Entity
	player = get_tree().get_nodes_in_group("player")[0]
