extends CharacterBody3D
class_name PlayerClass

var abilities = []
var current_health : int = 100
var speed : int = 8
var state_machine : StateMachine
var player_ui

func _ready():
	add_to_group("player")
	state_machine = get_node("StateMachine")
	player_ui = load("res://Entities/Player/UI/player_UI.tscn").instantiate()
	add_child(player_ui)
	var ability_config = get_node("/root/PlayerAbilities")
	var ability_names = ability_config.get_abilities()
	load_ability(ability_names)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func get_hit(damage_amount):
	state_machine.transition_to("GetHit", {"dmg_amount": damage_amount})

func load_ability(ability_names):
	var index = 0
	var sceneNode
	for ability_name in ability_names:
		if ability_name[0] == "":
			index += 1
			continue
		player_ui.set_ability(ability_name, index)
		index += 1
		sceneNode = load("res://Entities/Player/PlayerAbilities/" + ability_name[0] + ability_name[1] 
		+ "/" + ability_name[0] + ability_name[1] + ".tscn").instantiate()
		add_child(sceneNode)
		abilities.append(sceneNode)

