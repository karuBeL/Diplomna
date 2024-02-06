extends Camera3D

@onready var camera_player : CharacterBody3D = $"../.."


func _physics_process(_delta):
	look_at(camera_player.global_position)
