extends EntityClass


func _ready():
	set("speed", 10)
	add_to_group("player")
	var abilities = get_node("/root/Config").get_abilities()
	load_ability(abilities[0])
	load_ability(abilities[1])
	load_ability(abilities[2])
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
