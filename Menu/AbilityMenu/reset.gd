extends Button


func _ready():
	pressed.connect(reset_pressed)

func reset_pressed():
	get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")
