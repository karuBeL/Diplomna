extends Node


func execute(weapon : Node3D):

	tween1(weapon)
	#tween.tween_method(weapon.rotate_y.bind(), -PI/2, PI/2, 0.001)
	
func tween1(weapon : Node3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/2, 0.04)
	tween.connect("finished", tween2.bind(weapon))
	
func tween2(weapon : Node3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*-PI, 0.23)
	tween.connect("finished", tween3.bind(weapon))

func tween3(weapon : Node3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/2, 0.04)
