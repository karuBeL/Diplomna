extends State
class_name EnemyState

var enemy: EnemyClass
var player : PlayerClass
var is_attacking : bool

func _ready() -> void:
	await owner.ready
	enemy = owner as EnemyClass
	player = get_tree().get_nodes_in_group("player")[0]
