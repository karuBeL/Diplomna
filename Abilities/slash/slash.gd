extends Node3D

var to_be_lerped : Node3D
@export var weapon : Node3D
var fromPosition : float
var toPosition : float
var originalPosition : float
var targetPosition : float
var oldY : float
var newY : float
# Called when the node enters the scene tree for the first time.
func execute(weapon_pivot : Node3D):
	to_be_lerped = weapon_pivot
	originalPosition = to_be_lerped.rotation.y
	toPosition = weapon_pivot.rotation.y + PI/2
	fromPosition = weapon_pivot.rotation.y - PI/2
	targetPosition = fromPosition
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if to_be_lerped == null:
		return
	else:
		if targetPosition == fromPosition || targetPosition == fromPosition:
			to_be_lerped.rotation.y = lerp_angle(to_be_lerped.rotation.y, targetPosition, 0.6 + delta)
		else:
			to_be_lerped.rotation.y = lerp_angle(to_be_lerped.rotation.y, targetPosition, 0.3 + delta)
		if oldY == to_be_lerped.rotation.y && targetPosition == originalPosition:
			to_be_lerped = null
		elif oldY == to_be_lerped.rotation.y && targetPosition == fromPosition:
			targetPosition = toPosition
		elif oldY == to_be_lerped.rotation.y && targetPosition == toPosition:
			targetPosition = originalPosition
		else:
			oldY = to_be_lerped.rotation.y

		
			

