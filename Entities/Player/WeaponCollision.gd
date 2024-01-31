extends ShapeCast3D
var collided_object : EntityClass
var count
@export var weapon : Node3D

func get_collisions():
	force_shapecast_update()
	if !is_colliding():
		return
	count = get_collision_count()
	for i in count:
		collided_object = get_collider(i)
		collided_object.apply_damage(25)
	
func _process(delta):
	rotation.y = weapon.rotation.y + PI/4
