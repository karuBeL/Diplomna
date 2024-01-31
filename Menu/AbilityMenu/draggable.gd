extends ColorRect

var label : Label

func _ready():
	add_to_group("draggable")
	label = $Label

func _get_drag_data(at_position):
	print("yuh draggin")
	return {"self": self, "text": label.text}

