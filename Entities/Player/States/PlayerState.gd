extends State
class_name PlayerState

var player: EntityClass

func _ready() -> void:
	await owner.ready
	player = owner as EntityClass
