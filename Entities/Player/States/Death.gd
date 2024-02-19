extends PlayerState

@onready var animation_sprite = $"../../AnimatedSprite3D"
@onready var weapon = $"../../Weapon"

func enter(_msg := {}) -> void:
	animation_sprite.play("death")
	weapon.visible = false
	var timer = get_tree().create_timer(2)
	timer.timeout.connect(transition_to_start)

func transition_to_start():
	get_tree().change_scene_to_file("res://Menu/MainMenu/Menu.tscn")

