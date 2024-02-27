extends PanelContainer

@onready var label : Label = $Label

func show_text(wrong_combination : String):
	var pop_up_text = "Combination " + wrong_combination + " doesn't exit. Please select another ability"
	label.text = pop_up_text
	visible = true
