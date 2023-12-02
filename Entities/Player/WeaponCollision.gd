extends ShapeCast3D
var collided_object : Entity
@export var weapon : Node3D

func _ready():
	enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation = weapon.rotation
	if is_colliding():
		collided_object = get_collider(0)
		collided_object.apply_damage(25)
