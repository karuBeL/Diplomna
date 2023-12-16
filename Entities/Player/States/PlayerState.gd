extends State
class_name PlayerState

var player: Entity

func _ready() -> void:
	await owner.ready
	player = owner as Entity
