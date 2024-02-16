extends CharacterBody3D
class_name EntityClass

var current_health : int = 100
var speed : int = 5

@onready var state_machine = get_node("StateMachine")
func apply_damage(damage_amount):
	if current_health - damage_amount > 0:
		current_health -= damage_amount
		state_machine.transition_to("GetHit")
	if current_health - damage_amount <= 0:
		die()

func apply_stun(stun_amount : float, is_knockbacked : bool):
	var msg := {"time" : stun_amount, "knockback" : is_knockbacked}
	state_machine.transition_to("Stunned", msg)

func die():
	state_machine.transition_to("Death")
	
