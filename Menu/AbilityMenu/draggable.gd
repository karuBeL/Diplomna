extends Control

var ability_name : Label

func _ready():
	add_to_group("draggable")
	ability_name = $Label

func _get_drag_data(_at_position):
	return {"self": self, "text": ability_name.text}



