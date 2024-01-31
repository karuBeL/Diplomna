extends CharacterBody3D
class_name EntityClass

var max_health : int = 100
var current_health : int = 100
var speed : int = 5
var abilities = []
#@onready var hit_timer : SceneTreeTimer = get_tree().create_timer(0.0)

@onready var scene = get_node("StateMachine")
func apply_damage(damage_amount):
	if current_health - damage_amount > 0:#&& hit_timer.time_left == 0
		current_health -= damage_amount
		#hit_timer = get_tree().create_timer(1.0)
		scene.transition_to("GetHit")
		print("bruh")
	if current_health - damage_amount <= 0:
		die()

func apply_stun(stun_amount : float, is_knockbacked : bool):
	var msg := {"time" : stun_amount, "knockback" : is_knockbacked}
	scene.transition_to("Stunned", msg)

func die():
	scene.transition_to("Death")
	

func load_ability(name : String):
	if name.is_empty():
		return
	var scene = load("res://Entities/Player/PlayerAbilities/" + name + "/" + name + ".tscn")
	var sceneNode = scene.instantiate()
	add_child(sceneNode)
	abilities.append(sceneNode)
