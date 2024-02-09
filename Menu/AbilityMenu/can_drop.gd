extends ColorRect

var label : Label

func _ready():
	label = $Label

func _can_drop_data(_at_position, data):
	var can_drop = data.get("self").is_in_group("draggable")
	#print("in _can_drop_data function, returning %s" % can_drop)
	return can_drop

func _drop_data(_at_position, data):
	#print("in _drop_data, returning: ")
	#print(data.get("text"))
	set_label(data.get("text"))
	data.get("self").queue_free()

func set_label(label_name : String):
	label.text = label_name

