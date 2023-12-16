extends State
class_name BombState

var bomb : Node3D
var player : Entity

func _ready() -> void:
	await owner.ready
	bomb = owner as Node3D
	player = get_tree().get_nodes_in_group("player")[0]
