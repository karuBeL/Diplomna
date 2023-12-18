extends Node

func execute(weapon : Node3D, collision : ShapeCast3D):
	if collision.enabled:
		return
	collision.enabled = true
	tween1(weapon, collision)
	#tween.tween_method(weapon.rotate_y.bind(), -PI/2, PI/2, 0.001)

func tween1(weapon : Node3D, collision : ShapeCast3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/1.5, 0.04)
	tween.connect("finished", tween2.bind(weapon, collision))

func tween2(weapon : Node3D, collision : ShapeCast3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*-PI*4/3, 0.20)
	tween.connect("finished", tween3.bind(weapon, collision))

func tween3(weapon : Node3D, collision : ShapeCast3D):
	var tween = get_tree().create_tween()
	tween.tween_property(weapon, "rotation",\
	weapon.rotation + (Vector3.UP)*PI/1.5, 0.04)
	tween.connect("finished", disableCollision.bind(collision))

func disableCollision(collision : ShapeCast3D):
	collision.enabled = false
