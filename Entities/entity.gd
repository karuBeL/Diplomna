extends CharacterBody3D
class_name Entity

var max_health : int = 100
var current_health : int = 100
var speed : int = 10 
var abilities = []


func apply_damage(damage_amount):
	if(current_health - damage_amount < 0):
		current_health -= damage_amount
	else:
		die()

func die():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_ability(name):
	var scene = load("res://Player/PlayerAnimations/" + name + "/" + name + ".tscn")
	var sceneNode = scene.instantiate()
	add_child(sceneNode)
	abilities.append(sceneNode)
