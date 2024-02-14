extends EntityClass

func _ready():
	add_to_group("player")
	speed = 10
	var ability_names = get_node("/root/PlayerAbilities").get_abilities()
	load_ability(ability_names[0])
	load_ability(ability_names[1])
	load_ability(ability_names[2])
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

	
func load_ability(ability_name : String):
	if ability_name.is_empty():
		return
	var scene = load("res://Entities/Player/PlayerAbilities/" + ability_name + "/" + ability_name + ".tscn")
	var sceneNode = scene.instantiate()
	add_child(sceneNode)
	abilities.append(sceneNode)
