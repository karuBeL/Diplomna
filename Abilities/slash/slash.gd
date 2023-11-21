extends Node3D

var to_be_lerped : Node3D
@export var weapon : Node3D
var fromPosition : float
var toPosition : float
var originalPosition : float
var oldY : float
var newY : float
# Called when the node enters the scene tree for the first time.
func execute(weapon_pivot : Node3D):
	to_be_lerped = weapon_pivot
	originalPosition = to_be_lerped.rotation.y
	toPosition = weapon_pivot.rotation.y + PI/2
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if to_be_lerped == null:
		return
	else:
		
		to_be_lerped.rotation.y = lerp_angle(to_be_lerped.rotation.y, toPosition, 0.3 + delta)
		if oldY == to_be_lerped.rotation.y && toPosition == originalPosition:
			to_be_lerped = null
		elif oldY == to_be_lerped.rotation.y && toPosition != originalPosition:
			toPosition = originalPosition
		else:
			oldY = to_be_lerped.rotation.y

		
			

