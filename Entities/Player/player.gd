extends EntityClass
var abilities = []

func _ready():
	add_to_group("player")
	speed = 10
	var ability_names = get_node("/root/PlayerAbilities").get_abilities()
	load_ability(ability_names)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func load_ability(ability_names):
	for ability_name in ability_names:
		if ability_name == "":
			continue
		var scene = load("res://Entities/Player/PlayerAbilities/" + ability_name + "/" + ability_name + ".tscn") as PackedScene
		var sceneNode = scene.instantiate()
		add_child(sceneNode)
		abilities.append(sceneNode)

