extends PanelContainer

var b_ability1 : Label
var b_ability2 : Label 
var b_ability3 : Label 

# Called when the node enters the scene tree for the first time.
func _ready():
	b_ability1 = $HBoxContainer/Ability1/ColorRect/Label
	b_ability2 = $HBoxContainer/Ability2/ColorRect/Label
	b_ability3 = $HBoxContainer/Ability3/ColorRect/Label


func get_abilities():
	return [b_ability1.text.to_lower(), b_ability2.text.to_lower(), b_ability3.text.to_lower()]
