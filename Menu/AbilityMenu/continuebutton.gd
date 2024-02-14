extends Button

var abilities

var possible_abilities = {"bomb": null, "dash": null, "slash": null, "dashslash": null, 
"knockback": null, "knockbackdash": null, "slashbomb": null, "dashbomb": null, "": null}


func _ready():
	pressed.connect(continue_pressed)
	add_to_group("continue")
	
func continue_pressed():
	var b_abilities = $"../../BaseAbilities".get_abilities()
	var s_abilities = $"../../SecondaryAbilities".get_abilities()
	if b_abilities[0].is_empty() && b_abilities[1].is_empty() && b_abilities[2].is_empty():
		get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")
		return
	var ability_1 = b_abilities[0] + s_abilities[0]
	var ability_2 = b_abilities[1] + s_abilities[1]
	var ability_3 = b_abilities[2] + s_abilities[2]
	
	if !possible_abilities.has(ability_1) || !possible_abilities.has(ability_2)\
	|| !possible_abilities.has(ability_3):
		get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")
		return
	
	abilities = [b_abilities[0] + s_abilities[0], 
	b_abilities[1] + s_abilities[1], b_abilities[2] + s_abilities[2]]
	
	
	get_node("/root/PlayerAbilities").set_abilities(abilities)
	
	get_tree().change_scene_to_file("res://World/level.tscn")

