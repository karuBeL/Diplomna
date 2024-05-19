extends ColorRect

@onready var timer = $"../Timer"
@onready var cooldown = $"../Cooldown"
var label : Label

func _ready():
	timer.timeout.connect(stop_cooldown)
	label = $Label

func _can_drop_data(_at_position, data):
	var can_drop = data.get("self").is_in_group("draggable")
	return can_drop

func _drop_data(_at_position, data):
	set_label(data.get("text"))
	data.get("self").hide()

func set_label(label_name : String):
	label.text = label_name.capitalize()

func get_label():
	return label.text

func set_cooldown(value):
	if !timer.is_stopped():
		return
	timer.start(value)
	cooldown.show()

func stop_cooldown():
	cooldown.hide()

func _process(delta):
	if !timer.is_stopped():
		cooldown.text = str(snappedf(timer.time_left, 1))


