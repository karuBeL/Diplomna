extends State
class_name Enemy

var enemy: EntityClass
var player : EntityClass
var is_attacking : bool

func _ready() -> void:
	await owner.ready
	enemy = owner as EntityClass
	player = get_tree().get_nodes_in_group("player")[0]
