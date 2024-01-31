extends PanelContainer

var s_ability1 : Label
var s_ability2 : Label 
var s_ability3 : Label 

# Called when the node enters the scene tree for the first time.
func _ready():
	s_ability1 = $HBoxContainer/SecondaryAbility1/ColorRect/Label
	s_ability2 = $HBoxContainer/SecondaryAbility2/ColorRect/Label
	s_ability3 = $HBoxContainer/SecondaryAbility3/ColorRect/Label


func get_abilities():
	return [s_ability1.text.to_lower(), s_ability2.text.to_lower(), s_ability3.text.to_lower()]
