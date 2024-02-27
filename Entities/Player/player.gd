extends CharacterBody3D
class_name PlayerClass

var abilities = []
var current_health : int = 100
var speed : int = 8
var state_machine : StateMachine

func _ready():
	add_to_group("player")
	state_machine = get_node("StateMachine")
	var ability_names = get_node("/root/PlayerAbilities").get_abilities()
	load_ability(ability_names)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func get_hit(damage_amount):
	state_machine.transition_to("GetHit", {"dmg_amount": damage_amount})

func load_ability(ability_names):
	for ability_name in ability_names:
		if ability_name == "":
			continue
		var scene = load("res://Entities/Player/PlayerAbilities/" + ability_name + "/" + ability_name + ".tscn") as PackedScene
		var sceneNode = scene.instantiate()
		add_child(sceneNode)
		abilities.append(sceneNode)

