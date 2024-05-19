extends Button

var abilities

var possible_abilities = {"bomb": null, "dash": null, "slash": null, "dashslash": null, 
"knockback": null, "knockbackdash": null, "slashbomb": null, "dashbomb": null, "": null}
var base_container 
var secondary_container 
var tooltip
var ability_menu
var player_abilities

func _ready():
	ability_menu = $"../.."
	base_container = $"../../PlayerAbilities/AbilitiesMargin/BaseAbilities"
	secondary_container = $"../../PlayerAbilities/AbilitiesMargin/SecondaryAbilities"
	player_abilities = $"../../PlayerAbilities"
	tooltip = $"../../ToolTip"
	pressed.connect(continue_pressed)
	add_to_group("continue")
	
func continue_pressed():
	var b_abilities = base_container.get_abilities()
	var s_abilities = secondary_container.get_abilities()
	if b_abilities[0].is_empty() && b_abilities[1].is_empty() && b_abilities[2].is_empty():
		#get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")
		ability_menu.reset_abilities()
		tooltip.show_tooltip("Invalid combination of abilities")
		return
	var ability_1 = b_abilities[0] + s_abilities[0]
	var ability_2 = b_abilities[1] + s_abilities[1]
	var ability_3 = b_abilities[2] + s_abilities[2]
	
	if !possible_abilities.has(ability_1) || !possible_abilities.has(ability_2)\
	|| !possible_abilities.has(ability_3):
		#get_tree().change_scene_to_file("res://Menu/AbilityMenu/abilitymenu.tscn")
		ability_menu.reset_abilities()
		tooltip.show_tooltip("Invalid combination of abilities")
		return
	
	abilities = [[b_abilities[0],  s_abilities[0]], 
	[b_abilities[1],  s_abilities[1]], [b_abilities[2],  s_abilities[2]]]
	
	var abilities_config = get_node("/root/PlayerAbilities")
	abilities_config.set_abilities(abilities)
	
	get_tree().change_scene_to_file("res://World/level.tscn")

