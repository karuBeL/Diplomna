extends ColorRect

var label : Label

func _ready():
	label = $Label

func _can_drop_data(_at_position, data):
	var can_drop = data.get("self").is_in_group("draggable")
	return can_drop

func _drop_data(_at_position, data):
	set_label(data.get("text"))
	data.get("self").queue_free()

func set_label(label_name : String):
	label.text = label_name



