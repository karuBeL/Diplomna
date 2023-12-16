extends CharacterBody3D
class_name Entity

var max_health : int = 100
var current_health : int = 100
var speed : int = 5
var abilities = []
@onready var hit_timer : SceneTreeTimer = get_tree().create_timer(0.0)

func apply_damage(damage_amount):
	if current_health - damage_amount > 0 && hit_timer.time_left == 0:#&& hit_timer.time_left == 0
		current_health -= damage_amount
		print("oof")
		hit_timer = get_tree().create_timer(1.0)
	else:
		die()

func die():
	pass

func load_ability(name):
	var scene = load("res://Entities/Player/PlayerAnimations/" + name + "/" + name + ".tscn")
	var sceneNode = scene.instantiate()
	add_child(sceneNode)
	abilities.append(sceneNode)
