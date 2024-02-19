extends State
class_name PlayerState

var player: PlayerClass

func _ready() -> void:
	await owner.ready
	player = owner as PlayerClass
