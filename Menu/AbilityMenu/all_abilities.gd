extends PanelContainer

@onready var container = $HBoxContainer

func reset_abilities():
	for ability in container.get_children():
		ability.get_node("ColorRect").show()
