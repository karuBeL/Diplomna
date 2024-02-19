extends ShapeCast3D
var collided_object : EnemyClass
var count
var damage = 25
@export var weapon : Node3D

func get_collisions():
	rotation.y = weapon.rotation.y + PI/4
	force_shapecast_update()
	if !is_colliding():
		return
	count = get_collision_count()
	for i in count:
		collided_object = get_collider(i)
		collided_object.get_hit(damage)
	
