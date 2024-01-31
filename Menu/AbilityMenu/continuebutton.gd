extends Button

var abilities

func _ready():
	pressed.connect(continue_pressed)
	add_to_group("continue")
	
func continue_pressed():
	var b_abilities = $"../../BaseAbilities".get_abilities()
	var s_abilities = $"../../SecondaryAbilities".get_abilities()
	
	abilities = [b_abilities[0] + s_abilities[0], 
	b_abilities[1] + s_abilities[1], b_abilities[2] + s_abilities[2]]
	
	get_node("/root/Config").set_abilities(abilities)
	
	get_tree().change_scene_to_file("res://World/world.tscn")

