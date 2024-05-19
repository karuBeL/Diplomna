extends PanelContainer

var s_ability1
var s_ability2
var s_ability3
var s_abilities

func _ready():
	s_ability1 = $HBoxContainer/SecondaryAbility1/ColorRect
	s_ability2 = $HBoxContainer/SecondaryAbility2/ColorRect
	s_ability3 = $HBoxContainer/SecondaryAbility3/ColorRect
	s_abilities = [s_ability1, s_ability2, s_ability3]

func get_abilities():
	return [s_ability1.get_label().to_lower(), s_ability2.get_label().to_lower(), s_ability3.get_label().to_lower()]

func reset_abilities():
	s_ability1.set_label("")
	s_ability2.set_label("")
	s_ability3.set_label("")
