extends ShapeCast3D
var collided_object : Entity
var count
@export var weapon : Node3D

func _ready():
	enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation = weapon.rotation
	if !is_colliding():
		return
	count = get_collision_count()
	for i in count:
		collided_object = get_collider(i)
		collided_object.apply_damage(25)
	
