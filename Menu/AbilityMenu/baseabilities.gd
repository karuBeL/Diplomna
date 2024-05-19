extends PanelContainer

var b_ability1
var b_ability2 
var b_ability3
var b_abilities 

func _ready():
	b_ability1 = $HBoxContainer/Ability1/ColorRect
	b_ability2 = $HBoxContainer/Ability2/ColorRect
	b_ability3 = $HBoxContainer/Ability3/ColorRect
	b_abilities = [b_ability1, b_ability2, b_ability3]
	
func get_abilities():
	return [b_ability1.get_label().to_lower(), b_ability2.get_label().to_lower(), b_ability3.get_label().to_lower()]

func get_ability(index):
	return b_abilities[index]

func reset_abilities():
	b_ability1.set_label("")
	b_ability2.set_label("")
	b_ability3.set_label("")
