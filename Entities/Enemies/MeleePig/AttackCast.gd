extends ShapeCast3D

var player 

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(_delta):
	look_at(player.global_position)
